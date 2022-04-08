import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_error_models.freezed.dart';
part 'dio_error_models.g.dart';

@freezed
class CommonResponseError<Custom> with _$CommonResponseError<Custom> {
  const CommonResponseError._();

  const factory CommonResponseError.noNetwork() = _NoNetwork;

  const factory CommonResponseError.unAuthorized() = _UnAuthorized;

  const factory CommonResponseError.tooManyRequests() = _TooManyRequests;

  const factory CommonResponseError.customError(Custom customError) =
      _CustomError;

  const factory CommonResponseError.undefinedError(Object? errorObject) =
      _UndefinedError;

  bool get isNoNetwork => this is _NoNetwork;

  bool get isUnAuthorized => this is _UnAuthorized;

  bool get isTooManyRequests => this is _TooManyRequests;

  bool get isCustomError => this is _CustomError<Custom>;

  bool get isUndeffinedError => this is _UndefinedError;

  Custom? get safeCustom => this is _CustomError<Custom>
      ? (this as _CustomError<Custom>).customError
      : null;
}

@freezed
class DefaultApiError with _$DefaultApiError {
  const factory DefaultApiError({
    required String name,
    required String code,
  }) = _DefaultApiError;

  factory DefaultApiError.fromJson(Map<String, dynamic> json) =>
      _$DefaultApiErrorFromJson(json);
}
