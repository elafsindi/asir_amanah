import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          VerticalSpace(10),
          SizedBox(
            child: Image.asset(kLogo),
            height: SizeConfig.defaultSize! * 17,
          ),

          VerticalSpace(3),

          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 51,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: 'مرحبا بك في أمانة عسير',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          ),
          // Expanded(child: SizedBox()),
          VerticalSpace(5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomGeneralButton(
                  onTap: () {
                    Get.to(() => LoginView());
                  },
                  text: 'تسجيل الدخول عبر البريد الالكتروني',
                ),
                VerticalSpace(3),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'أو',
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                VerticalSpace(3),
                CustomButtonWithIcon(
                  text: 'تسجيل الدخول عبر نفاذ الوطني',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
