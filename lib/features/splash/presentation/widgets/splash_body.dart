import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/features/onBoarding/presentation/on_bording_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Background(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            FadeTransition(
              opacity: fadingAnimation!,
              child: Image.asset(
                'assets/imgs/asir_logo.png',
                width:
                    MediaQuery.of(context).size.width * 0.5, // نصف عرض الشاشة
              ),
            ),
            FadeTransition(
              opacity: fadingAnimation!,
              child: Text(
                'مرحبا بك في أمانة عسير',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => OnBordingView(), transition: Transition.fade);
    });
  }
}
