import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class IssueDescriptionField extends StatelessWidget {
  final String description;
  final Function(String) onChanged;

  IssueDescriptionField({required this.description, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'وصف البلاغ',
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        alignLabelWithHint: true,
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
    );
  }
}
