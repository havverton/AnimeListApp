import 'dart:io';

import '../core/core.dart';

class NetworkException<T> extends BaseException<T> {
  const NetworkException([T? message]) : super(message);
}

class UndefinedNetworkException<T> extends NetworkException<T> {
  const UndefinedNetworkException([T? message]) : super(message);
}

class HttpException<T> extends NetworkException<T> {
  final int status;
  const HttpException(this.status, [T? message]) : super(message);

  static NetworkException<T> map<T>(int status, [T? data]) {
    switch (status) {
      case HttpStatus.badRequest:
        return BadRequest(data);

      case HttpStatus.unauthorized:
        return Unauthorized(data);

      case HttpStatus.notFound:
        return NotFound(data);
    }

    return UndefinedNetworkException(data);
  }
}

class NoInternetConnection<T> extends BaseException<T> {
  const NoInternetConnection([T? message]) : super(message);
}

class NotFound<T> extends HttpException<T> {
  const NotFound([T? message]) : super(HttpStatus.notFound, message);
}

class BadRequest<T> extends HttpException<T> {
  const BadRequest([T? message]) : super(HttpStatus.badRequest, message);
}

class Unauthorized<T> extends HttpException<T> {
  const Unauthorized([T? message]) : super(HttpStatus.unauthorized, message);
}
