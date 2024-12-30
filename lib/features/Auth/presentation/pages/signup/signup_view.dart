import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/signup/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
      body: SignupViewBody(),
    );
  }
}