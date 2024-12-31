import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class IssueTypeDropdown extends StatelessWidget {
  final String selectedIssueType;
  final Function(String) onChanged;
  final String labelText; // النص المخصص للعنوان
  final List<String> items; // قائمة العناصر القابلة للاختيار

  IssueTypeDropdown({
    required this.selectedIssueType,
    required this.onChanged,
    required this.labelText, // تمرير النص عند الاستدعاء
    required this.items, // تمرير قائمة العناصر عند الاستدعاء
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText, // استخدام النص المخصص للعنوان
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
          items: items.map<DropdownMenuItem<String>>((String value) {
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
