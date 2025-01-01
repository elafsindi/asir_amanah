import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/signup/widgets/signup_view_item.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
                    text: 'نسيت كلمة المرور',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpace(2),
            Text(
              'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            VerticalSpace(2),
            SignupViewItem(
              text: 'البريد الإلكتروني',
                hintText: 'أدخل البريد الإلكتروني',

            ),
            VerticalSpace(1),
            GestureDetector(
              onTap: () {
                // أضف هنا الكود الخاص بإعادة تعيين كلمة المرور
                Get.snackbar('تم', 'تم إرسال تعليمات إعادة تعيين كلمة المرور');
              },
              child: CustomGeneralButton(
                text: 'إرسال',
              ),
            ),
            VerticalSpace(1),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // الرجوع إلى صفحة تسجيل الدخول
                  Get.back();
                },
                child: Text(
                  'عودة إلى تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
