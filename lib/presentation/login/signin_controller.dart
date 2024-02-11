import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state; //Access bloc in the UI
        String emailAddress = state.email ?? "";
        String password = state.password ?? "";
        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
      }
    } catch (e) {}
  }
}
