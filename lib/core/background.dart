import 'package:flutter/material.dart';
import 'package:asir_amanah/core/constants.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6, // ارتفاع التدرج
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.transparent, // بداية التدرج شفاف
                    const Color.fromARGB(57, 117, 182, 200),

                  ],
                ),
              ),
            ),
          ),

          
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/imgs/top_left_image.png',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/imgs/bottom_right_image.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
            ),
          ),

          
          child,
        ],
      ),
    );

    
  }
}
