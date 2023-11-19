import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty(String value) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailInputError.empty) return 'Required field';
    if (displayError == EmailInputError.format) return 'No email format';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailInputError.format;
    return null;
  }
}
