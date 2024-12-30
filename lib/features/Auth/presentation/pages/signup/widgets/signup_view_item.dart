import 'package:asir_amanah/core/widgets/custom_text_field.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class SignupViewItem extends StatelessWidget {
  const SignupViewItem({Key? key, required this.text, this.inputType, this.maxLines})
      : super(key: key);
  final String text;
  final TextInputType? inputType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Directionality(
  textDirection: TextDirection.rtl,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.5625,
              
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          ),
          VerticalSpace(0.4),
          CustomTextFormField(
            maxLines: 1,
            inputType: inputType,
          )
        ],
      ),
    );
  }
}