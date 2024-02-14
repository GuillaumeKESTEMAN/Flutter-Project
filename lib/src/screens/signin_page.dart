import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/utils/string.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      showPasswordVisibilityToggle: true,
      actions: [
        AuthStateChangeAction<SignedIn>(((context, state) {
          final user = state.user;
          if (user == null) {
            return;
          }

          user.updateDisplayName(user.email!
              .split('@')[0]
              .split('.')
              .map((e) => capitalize(e))
              .join(' '));

          context.pushReplacement('/');
        })),
      ],
    );
  }
}
