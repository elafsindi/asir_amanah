import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class IssueDescriptionField extends StatelessWidget {
  final String description;
  final Function(String) onChanged;
  final String labelText; // النص المستخدم للعنوان (label)
  final String hintText;  // النص المستخدم للإرشاد داخل الحقل

  IssueDescriptionField({
    required this.description,
    required this.onChanged,
    required this.labelText,  // إزالة القيمة الافتراضية
    required this.hintText,   // إزالة القيمة الافتراضية
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText, // استخدام النص الذي تم تمريره
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText, 
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6), 
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(kMainColor), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(kMainColor), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(kMainColor), width: 2.0),
            ),
          ),
          maxLines: 4,
          onChanged: onChanged,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
