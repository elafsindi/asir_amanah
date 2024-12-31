import 'package:flutter/material.dart';

class ReportSuccess extends StatelessWidget {
  final String requestSuccess;

  const ReportSuccess({required this.requestSuccess, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 60),
        SizedBox(height: 16),
        Text(
          'تم تقديم طلب الخدمة بنجاح',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'رقم الطلب: $requestSuccess',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}
