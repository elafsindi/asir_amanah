import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/requests/presentation/widgets/requests_header.dart';
import 'package:flutter/material.dart';

class RequestsViewBody extends StatelessWidget {
  const RequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: RequestsHeader(title: "تتبع الطلبات الخاصة"), 
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 7, // عدد العناصر
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent, // لجعل الكارد شفاف
                  margin: EdgeInsets.only(bottom: 16), // المسافة بين العناصر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // زوايا مستديرة
                    side: BorderSide(
                      color: Color(kMainColor),
                      width: 2, // سمك الحدود
                    ),
                  ),
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(kMainColor), // اللون الخلفي
                                
                                borderRadius: BorderRadius.circular(
                                    8), // زوايا مستديرة للحدود
                              ),
                              child: Text(
                                "قيد إجراء",
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
          ),
        ),
      ],
    );
  }
}
