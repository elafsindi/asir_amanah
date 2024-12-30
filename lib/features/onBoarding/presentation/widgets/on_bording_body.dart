import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/coustom_indicator.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/onBoarding/presentation/welcome_screen.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBordingBody extends StatefulWidget {
  const OnBordingBody({super.key});

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {

  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0
    )..addListener(() {
      setState(() {
        
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          CustomPageView(
            pageController: pageController,
          ),
          // الصور والكلام
      
          // ...
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.defaultSize! * 25,
            child: CoustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            ),
          ),
      
          Visibility(
            visible: pageController!.hasClients ? (pageController?.page == 2 ? false : true) : true, 
            child: Positioned(
              top: SizeConfig.defaultSize! * 15,
              left: 32,
              child: GestureDetector(
                onTap: () {
                    Get.to(() => LoginView(), transition: Transition.leftToRight , duration: Duration(milliseconds: 500));
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      
          Positioned(
              left: SizeConfig.defaultSize! * 10,
              right: SizeConfig.defaultSize! * 10,
              bottom: SizeConfig.defaultSize! * 15,
              child: CustomGeneralButton(
                 onTap: () {
                  if (pageController!.page! < 2) {
                    pageController?.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    Get.to(() => WelcomeScreen(), transition: Transition.leftToRight , duration: Duration(milliseconds: 500));
                  }
                },
                text: pageController!.hasClients ? (pageController?.page == 2 ? 'بدأ' : 'التالي') : 'التالي',
              )),
        ],
      ),
    );
  }
}
