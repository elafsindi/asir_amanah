import 'package:flutter/material.dart';
import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/requests/presentation/widgets/requests_header.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: RequestsHeader(title: "الإشعارات"), 
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 7, // عدد العناصر
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent, // لجعل الكارد شفاف
                  margin: EdgeInsets.only(bottom: 16), // المسافة بين العناصر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // زوايا مستديرة
                    side: BorderSide(
                      color: Color(kMainColor).withOpacity(0.5), // لون الحدود الشفاف
                      width: 2, // سمك الحدود
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // رمز الإشعار
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color(kMainColor),
                              size: 30,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "إشعار جديد",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // رسالة الإشعار
                        Text(
                          "لقد تم تحديث حالة البلاغ الخاص بك إلى 'قيد التنفيذ'.",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        // تاريخ الإشعار
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2024-12-30",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
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
