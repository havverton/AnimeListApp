import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:retry/retry.dart';

import '../../core/core.dart';
import 'models/dio_error_models.dart';

export 'models/dio_error_models.dart';

typedef ParseJsonApiError<DE> = Future<DE?> Function(Map<String, dynamic>?);
typedef MakeRequest<T> = Future<T> Function();

/// The protocol for handling [MakeRequest] requests from [Dio] returns [Either] as a result
/// The left part is responsible for errors of [CommonResponseError] kind
/// The right part returns the result of Dio request [Response]
abstract class DioErrorHandler<DE> {
  Future<Either<CommonResponseError<DE>, T>> processRequest<T>(
      MakeRequest<T> makeRequest);
}

/// Basic implementation of [DioErrorHandler]
///
/// In case of an error corresponding to [retryStatusCodes], 3 attempts are made to retry the data.
/// In case there is no internet or connection problems it returns an error in the left part of Either [CommonResponseError.noNetwork]
/// In case server rejected request with code [_HttpStatus.unauthorized] returns Either [CommonResponseError.unAuthorized]
/// If the server returned an error corresponding to [DefaultApiError] it will return [CommonResponseError.customError].
/// If [DioError] does not meet any of the criteria [CommonResponseError.undefinedError] is returned
class DioErrorHandlerImpl<DE> implements DioErrorHandler<DE> {
  DioErrorHandlerImpl({
    required this.connectivity,
    required this.logger,
    required this.parseJsonApiError,
    this.maxAttemptsCount = defaultMaxAttemptsCount,
    this.retryStatusCodes = defaultRetryStatusCodes,
    this.undefinedErrorCodes = defaultUndefinedErrorCodes,
  });

  /// The number of attempts to overrun the request
  static const defaultMaxAttemptsCount = 3;

  /// Error codes that require request re-execution (no bad request)
  static const retryStatusCodesWithoutBadReq = [
    _HttpStatus.notFound,
    _HttpStatus.forbidden,
    _HttpStatus.unauthorized,
    _HttpStatus.unsupportedMediaType,
  ];

  /// A basic list of error codes that require the query to be reexecuted
  static const defaultRetryStatusCodes = [
    ...retryStatusCodesWithoutBadReq,
    _HttpStatus.badRequest,
  ];

  /// List of error codes indicating unknown server behavior - [CommonResponseError.undefinedError]
  static const defaultUndefinedErrorCodes = [
    _HttpStatus.internalServerError,
    _HttpStatus.notImplemented,
    _HttpStatus.badGateway,
    _HttpStatus.serviceUnavailable,
  ];

  @protected
  final Connectivity connectivity;
  @protected
  final Logger logger;
  @protected
  final List<int> retryStatusCodes;
  @protected
  final List<int> undefinedErrorCodes;
  final int maxAttemptsCount;
  @protected
  ParseJsonApiError<DE> parseJsonApiError;

  @override
  Future<Either<CommonResponseError<DE>, T>> processRequest<T>(
      MakeRequest<T> makeRequest) async {
    final resultConnectivity = await connectivity.checkConnectivity();
    if (resultConnectivity == ConnectivityResult.none) {
      return const Either.left(CommonResponseError.noNetwork());
    }

    try {
      final response = await retry(
        makeRequest,
        maxAttempts: maxAttemptsCount,
        retryIf: (exception) => _retryPolicy(
          exception: exception,
          retryStatusCodes: retryStatusCodes,
        ),
      );

      return Either.right(response);
    } on DioError catch (e) {
      return Either.left(await _processDioError(e));
    } on Exception catch (e) {
      logger.error('An error was thrown while processing the request', e);
      return Either.left(CommonResponseError.undefinedError(e));
    }
  }

  //Request retry policy
  FutureOr<bool> _retryPolicy({
    required Exception exception,
    required List<int> retryStatusCodes,
  }) {
    if (exception is! DioError) {
      return false;
    }
    if (exception.type == DioErrorType.cancel) {
      return false;
    }
    final response = exception.response;
    if (response == null) {
      logger.warning(
        'Network request response processing error:',
        exception.message,
      );

      return true;
    }

    return retryStatusCodes.contains(response.statusCode);
  }

  Future<CommonResponseError<DE>> _processDioError(DioError e) async {
    final dynamic responseData = e.response?.data;
    final statusCode = e.response?.statusCode;

    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.sendTimeout ||
        statusCode == _HttpStatus.networkConnectTimeoutError) {
      return const CommonResponseError.noNetwork();
    }

    if (statusCode == _HttpStatus.unauthorized) {
      return const CommonResponseError.unAuthorized();
    }

    if (statusCode == _HttpStatus.tooManyRequests) {
      return const CommonResponseError.tooManyRequests();
    }

    if (undefinedErrorCodes.contains(statusCode)) {
      return CommonResponseError.undefinedError(e);
    }

    Object? errorJson;
    if (responseData is String) {
      //in case the Response<String> was expected, it will not parse the returned json error
      //and we need to do it manually
      try {
        errorJson = jsonDecode(responseData);
      } on FormatException {
        logger.warning(
          'Got the answer: \n "$responseData" \n which is not JSON',
        );
      }
    } else if (responseData is Map<String, dynamic>) {
      errorJson = responseData;
    }

    if (errorJson is Map<String, dynamic>) {
      try {
        final apiError = await parseJsonApiError(errorJson);
        if (apiError != null) {
          return CommonResponseError.customError(apiError);
        }
        // ignore: avoid_catching_errors
      } on TypeError catch (e) {
        logger.warning(
          'The response with an error from the server \n $responseData \n does not match the ApiError contract',
          e,
        );
      }
    }

    return CommonResponseError.undefinedError(e);
  }
}

class _HttpStatus {
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int unsupportedMediaType = 415;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;

  static const int networkConnectTimeoutError = 599;
  static const int tooManyRequests = 429;
}
