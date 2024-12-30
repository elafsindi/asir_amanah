import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class RequestsViewBody extends StatelessWidget {
  const RequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 7, // لتكرار المستطيلات 5 مرات
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // رقم البلاغ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "رقم البلاغ: 123456",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        color: Color(kMainColor),
                        child: Text(
                          "تحت إجراء",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // تاريخ التقديم
                  Text(
                    "تاريخ التقديم: 2024-12-30",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  // نوع البلاغ
                  Text(
                    "نوع البلاغ: بلاغ عام",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}