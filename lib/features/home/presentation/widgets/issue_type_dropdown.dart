import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class IssueTypeDropdown extends StatelessWidget {
  final String selectedIssueType;
  final Function(String) onChanged;

  IssueTypeDropdown({required this.selectedIssueType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'اختر نوع البلاغ',
          labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedIssueType,
          onChanged: (String? newValue) {
            onChanged(newValue!);
          },
          items: [
            'اختر نوع البلاغ',
            'مشكلة تقنية',
            'مشكلة في الخدمة',
            'مشكلة في الطلب'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          dropdownColor: Colors.black.withOpacity(0.7),
          underline: SizedBox(),
        ),
      ),
    );
  }
}
