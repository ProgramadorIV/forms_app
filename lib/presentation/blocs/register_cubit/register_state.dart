part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final FormStatus formStatus;
  final bool isValid;
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
