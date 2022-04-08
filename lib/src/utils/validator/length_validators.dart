import 'validator.dart';

class MinLengthValidator extends Validator<String> {
  const MinLengthValidator(this.minLength,
      [String errorMessage = 'Inivalid length'])
      : super(errorMessage);

  final int minLength;

  @override
  bool validate(String? value) {
    if (value == null) {
      return false;
    }

    return value.length >= minLength;
  }
}
