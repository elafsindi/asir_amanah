import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/login/widgets/login_view_body.dart';
import 'package:asir_amanah/features/onBoarding/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
      body: LoginViewBody(),
    );
  }
}