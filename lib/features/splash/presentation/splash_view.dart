import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
       body: SplashViewBody(),
    );
   
  }
} 