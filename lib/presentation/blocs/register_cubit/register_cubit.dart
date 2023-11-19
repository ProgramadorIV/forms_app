import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: UsernameInput.dirty(state.username.value),
      password: PasswordInput.dirty(state.password.value),
      email: EmailInput.dirty(state.email.value),
      isValid: Formz.validate([
        state.username,
        state.password,
      ]),
    ));
  }

  void usernameChange(String value) {
    final UsernameInput usernameInput = UsernameInput.dirty(value);

    emit(state.copyWith(
      username: usernameInput,
      isValid: Formz.validate([usernameInput]),
    ));
  }

  void emailChange(String value) {
    final EmailInput emailInput = EmailInput.dirty(value);
    emit(state.copyWith(
      email: emailInput,
      isValid: Formz.validate([emailInput]),
    ));
  }

  void passwordChange(String value) {
    final PasswordInput passwordInput = PasswordInput.dirty(value);

    emit(state.copyWith(
      password: passwordInput,
      isValid: Formz.validate([passwordInput]),
    ));
  }
}
