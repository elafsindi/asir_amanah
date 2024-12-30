import 'package:asir_amanah/features/onBoarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key,@required this.pageController}) : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController ,
      children: [
        PageViewItem(
          image: 'assets/imgs/pageview1.png',
          title: 'ساهم في صنع الفرق مع تطبيق أمانة عسير',
          subTitle: 'شارك في تحسين مدينتك عبر الإبلاغ عن المشكلات وتقديم الاقتراحات.',
        ),
        PageViewItem(
          image: 'assets/imgs/pageview2.png',
          title: 'أبلغ عن الأضرار وسنعمل على حلها فورًا',
          subTitle: 'نحن ملتزمون بالاستجابة السريعة ومعالجة الأضرار فور الإبلاغ لضمان بيئة آمنة للجميع.',
        ),
        PageViewItem(
          image: 'assets/imgs/pageview3.png',
          title: 'نسعى لحل المشكلات بسرعة وكفاءة',
          subTitle: 'نقدم حلولاً مبتكرة وفعالة لتحقيق النتائج بسرعة وجودة عالية.',
        ),
        
      ],
    );
  }
}