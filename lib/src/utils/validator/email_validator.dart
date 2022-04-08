import 'validator.dart';

class EmailValidator extends Validator<String> {
  EmailValidator([String errorMessage = 'Invalid Email']) : super(errorMessage);

  @override
  bool validate(String? value) {
    if (value == null) {
      return false;
    }

    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return emailRegExp.hasMatch(value);
  }
}
