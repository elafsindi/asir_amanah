import 'package:asir_amanah/core/background.dart';
import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/core/utils/size_config.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/Auth/presentation/pages/signup/signup_view.dart'; // تحديث المسار إلى صفحة التسجيل
import 'package:asir_amanah/features/Auth/presentation/pages/signup/widgets/signup_view_item.dart';
import 'package:asir_amanah/features/home/presentation/home_page.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({Key? key}) : super(key: key);

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
                    text: 'تسجيل جديد',  // تغيير العنوان
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
              text: 'البريد الإلكتروني', 
                hintText: 'أدخل البريد الإلكتروني',
 // تغيير النص إلى البريد الإلكتروني
            ),
            VerticalSpace(1),
            SignupViewItem(
              text: 'كلمة المرور',
                hintText: 'أدخل كلمة المرور',

              inputType: TextInputType
                  .visiblePassword, // تعيين نوع المدخل ليكون كلمة مرور
              isPassword: true, // تفعيل خاصية إخفاء النص
            ),
            VerticalSpace(1),
            SignupViewItem(
              text: 'تأكيد كلمة المرور',
                hintText: 'تأكيد كلمة المرور',
  // إضافة حقل لتأكيد كلمة المرور
              inputType: TextInputType
                  .visiblePassword, // تعيين نوع المدخل ليكون كلمة مرور
              isPassword: true,
            ),            
            VerticalSpace(3),
            GestureDetector(
              onTap: () {
                Get.to(() => HomePage());
              },
              child: CustomGeneralButton(
                text: 'تسجيل',
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
                    'لديك حساب بالفعل؟',  // تغيير النص إلى "لديك حساب بالفعل؟"
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginView());  // تغيير الرابط إلى صفحة تسجيل الدخول
                  },
                  child: Text(
                    'تسجيل الدخول',  // تغيير النص إلى "تسجيل الدخول"
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
