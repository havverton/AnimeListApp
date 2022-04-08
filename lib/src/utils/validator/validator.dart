typedef TextFieldValidator = String? Function(String?);

typedef ValidatorFunction<T> = bool Function(T?);

abstract class Validator<T> {
  const Validator([this._errorMessage = 'InvalidValue']);

  final String _errorMessage;

  bool validate(T? value);

  String? validationError(T? value) {
    final result = validate(value);

    if (result) {
      return null;
    }

    return _errorMessage;
  }

  bool call([T? param]) => validate(param);

  static Validator<T> combine<T>(List<Validator<T>> validators,
      [String errorMessage = 'Invalid value']) {
    return Validator.custom(
      (value) {
        for (final validator in validators) {
          if (!validator.validate(value)) {
            return false;
          }
        }

        return true;
      },
      errorMessage,
    );
  }

  static TextFieldValidator textFieldValidator(
    List<Validator<String>> validators, {
    bool ignoreIfEmpty = false,
  }) {
    return (value) {
      if (ignoreIfEmpty && !Validator.string(value)) {
        return null;
      }

      for (final validator in validators) {
        final message = validator.validationError(value);

        if (Validator.notNull(message)) {
          return message;
        }
      }

      return null;
    };
  }

  factory Validator.custom(ValidatorFunction<T> validator,
      [String errorMessage]) = _CustomValidator;

  /// is [String] validator
  static Validator<dynamic> get string => Validator<dynamic>.custom(
      (dynamic value) => value != null && value is String);

  static Validator<dynamic> get notNull =>
      Validator<dynamic>.custom((dynamic value) => value != null);

  static Validator<String> minLength(int length) => Validator.custom(
        (value) {
          if (value == null) {
            return false;
          }

          return value.length >= length;
        },
      );
}

class _CustomValidator<T> extends Validator<T> {
  final ValidatorFunction<T> _validator;

  _CustomValidator(this._validator, [String errorMessage = 'Invalid value'])
      : super(errorMessage);

  @override
  bool validate(T? value) => _validator(value);
}
