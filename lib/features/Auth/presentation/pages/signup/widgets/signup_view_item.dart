import 'package:flutter/material.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';

class SignupViewItem extends StatelessWidget {
  const SignupViewItem({
    Key? key,
    required this.hintText,
    required this.text,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  final String text;
  final TextInputType inputType;
  final int? maxLines;
  final bool isPassword;

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
            textAlign: TextAlign.right,
          ),
          VerticalSpace(0.4),
          CustomTextFormField(
            maxLines: maxLines!,
            inputType: inputType,
            obscureText: isPassword,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final int maxLines;
  final TextInputType inputType;
  final bool obscureText;
  final String hintText;

  const CustomTextFormField({
    Key? key,
    required this.maxLines,
    required this.inputType,
    this.obscureText = false,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: inputType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white), 
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.6),
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
