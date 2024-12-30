import 'package:asir_amanah/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
      textDirection: TextDirection.rtl,
      child: HomePageBody()),
    );
  }
}