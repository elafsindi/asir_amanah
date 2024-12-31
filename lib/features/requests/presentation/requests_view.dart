import 'package:asir_amanah/core/widgets/blurred_background.dart';
import 'package:asir_amanah/features/requests/presentation/widgets/requests_header.dart';
import 'package:asir_amanah/features/requests/presentation/widgets/requests_view_body.dart';
import 'package:flutter/material.dart';
// استدعاء الويدجت الجديدة

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية: استدعاء الويدجت المغبشة
          const BlurredBackground(imagePath: 'assets/imgs/map.png'),
          // المحتوى الأمامي: استدعاء RequestsContent
          const RequestsViewBody(),

        ],
      ),
    );
  }
}
