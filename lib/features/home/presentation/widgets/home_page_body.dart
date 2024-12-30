import 'dart:ui';
import 'package:asir_amanah/core/blurred_container.dart';
import 'package:flutter/material.dart';
import 'package:asir_amanah/features/home/presentation/widgets/menu_header.dart';
import 'package:asir_amanah/features/home/presentation/widgets/quick_actions.dart';
import 'package:asir_amanah/features/home/presentation/widgets/report_form.dart';
import 'package:asir_amanah/features/home/presentation/widgets/report_success.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool isReportIssueSelected = false;
  bool isReportSubmitted = false;
  String reportNumber = '';

  // إدارة اختيار من القائمة
  void _handleMenuSelection(int value) {
    setState(() {
      isReportIssueSelected = value == 1;
    });
  }

  // إرسال البلاغ بنجاح
  void _onReportSubmitted(String reportNumber) {
    setState(() {
      this.reportNumber = reportNumber;
      isReportSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/map.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // رأس القائمة
            MenuHeader(onMenuSelection: _handleMenuSelection),
            Spacer(),
            // منطقة عرض البلاغات والإجراءات السريعة
            BlurredContainer(
              child: Column(
                children: [
                  // إذا تم اختيار الإبلاغ عن مشكلة، نعرض شاشة النجاح فقط بعد الإبلاغ
                  isReportIssueSelected
                      ? (isReportSubmitted
                          ? ReportSuccess(reportNumber: reportNumber)
                          : QuickActions(onMenuSelected: _handleMenuSelection))
                      : QuickActions(onMenuSelected: _handleMenuSelection), // عرض الإجراءات السريعة
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
