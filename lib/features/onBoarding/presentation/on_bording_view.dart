import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/on_bording_body.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
      body: Directionality(
      textDirection: TextDirection.rtl,
      child: OnBordingBody()),
    );
  }
} 