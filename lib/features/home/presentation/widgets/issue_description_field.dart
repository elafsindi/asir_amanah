import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class IssueDescriptionField extends StatefulWidget {
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
  _IssueDescriptionFieldState createState() => _IssueDescriptionFieldState();
}

class _IssueDescriptionFieldState extends State<IssueDescriptionField> {
  // إضافة FocusNode للتحكم في إخفاء الكيبورد
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // تأكد من تنظيف الـ FocusNode عند التخلص من الودجت
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText, // استخدام النص الذي تم تمريره
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText, 
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6), 
            ),
            filled: true,
            fillColor: const Color.fromARGB(0, 170, 51, 51),
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
          onChanged: widget.onChanged,
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.done, // زر الكيبورد "تم"
          onEditingComplete: () {
            // إخفاء الكيبورد عند الضغط على "تم"
            _focusNode.unfocus();
          },
        ),
      ],
    );
  }
}
