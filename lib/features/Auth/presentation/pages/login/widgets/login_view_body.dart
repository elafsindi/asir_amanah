import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/ForgotPassword/forgot_password_view.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/signup/signup_view.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/signup/widgets/signup_view_item.dart';
import 'package:asir_amanah/features/home/presentation/home_page.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            VerticalSpace(10),
            SizedBox(
              child: Image.asset(kLogo),
              height: SizeConfig.defaultSize! * 17,
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: 'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpace(2),
            SignupViewItem(
              text: 'البريد الالكتروني',
                hintText: 'أدخل البريد الإلكتروني',

            ),
            VerticalSpace(1),
            SignupViewItem(
              text: 'كلمة المرور',
                hintText: 'أدخل كلمة المرور',

              inputType: TextInputType.visiblePassword, // تعيين نوع المدخل ليكون كلمة مرور
              isPassword: true, // تفعيل خاصية إخفاء النص
            ),
            VerticalSpace(0.7),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // التوجيه إلى صفحة "نسيت كلمة المرور"
                  Get.to(() => ForgotPasswordView()); 
                },
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            VerticalSpace(3),
            GestureDetector(
              onTap: () {
                Get.to(() => HomePage());
              },
              child: CustomGeneralButton(
                text: 'تسجيل الدخول',
              ),
            ),
            VerticalSpace(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignupView());
                  },
                  child: Text(
                    'تسجيل',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
