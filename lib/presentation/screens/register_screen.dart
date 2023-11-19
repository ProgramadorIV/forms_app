import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.person_rounded,
                color: colors.primary,
                size: 200,
              ),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final usernameInput = registerCubit.state.username;
    final passwordInput = registerCubit.state.password;
    final emailInput = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            hintText: 'Enter your username',
            errorMessage: usernameInput.errorMessage,
            onChanged: registerCubit.usernameChange,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Enter your email',
            errorMessage: emailInput.errorMessage,
            onChanged: registerCubit.emailChange,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            hintText: 'Enter your password',
            errorMessage: passwordInput.errorMessage,
            onChanged: registerCubit.passwordChange,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
