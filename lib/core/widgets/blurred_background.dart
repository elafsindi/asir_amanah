import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  final String imagePath;

  const BlurredBackground({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // مسار الصورة
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // تأثير التمويه
        child: Container(
          color: Colors.black.withOpacity(0.2), // طبقة شفافة فوق الخلفية
        ),
      ),
    );
  }
}
