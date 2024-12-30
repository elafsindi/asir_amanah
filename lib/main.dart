import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/splash_view.dart';


void main() {
  runApp(const AsirAmanah());
}

class AsirAmanah extends StatelessWidget {
  const AsirAmanah({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Tajawal'
        ),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
       home: SplashView(),
    );
    // بضيف القيت متيريال اب 
    // بتسهل athufction
    //  اسنكنشن pubspec  
    
  }
}