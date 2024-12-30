import 'package:asir_amanah/core/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CoustomIndicator extends StatelessWidget {
  const CoustomIndicator({Key? key,@required this.dotIndex}) : super(key: key);
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Color(kMainColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Color(kMainColor)),
          )),
      dotsCount: 3,
      position: (dotIndex ?? 0).round(),
    );
  }
}