import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/home/presentation/widgets/quick_actions_list.dart';
import 'package:asir_amanah/features/home/presentation/widgets/report_form.dart';
import 'package:asir_amanah/features/home/presentation/widgets/service_request_form.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:asir_amanah/features/requests/presentation/requests_view.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatefulWidget {
  final Function(int) onMenuSelected;

  QuickActions({required this.onMenuSelected});

  @override
  _QuickActionsState createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  bool isReportFormVisible = false;
  bool isReportSubmitted = false;
  bool isServiceRequestForm = false;
  bool isRequestSubmitted = false;
  String reportNumber = '';
  String requestSuccess = '';

  void _onReportSubmitted(String reportNumber) {
    setState(() {
      this.reportNumber = reportNumber;
      isReportSubmitted = true;
    });
  }

  void _onRequestSubmitted(String requestSuccess) {
    setState(() {
      this.requestSuccess = requestSuccess;
      isRequestSubmitted = true;
    });
  }

  void _resetState() {
    setState(() {
      isReportFormVisible = false;
      isReportSubmitted = false;
      isServiceRequestForm = false;
      isRequestSubmitted = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    // حالة إرسال البلاغ
    if (isReportSubmitted) {
      return _buildReportSubmitted();
    }

    // حالة عرض فورم البلاغ
    if (isReportFormVisible) {
      return _buildReportForm();
    }

    if (isRequestSubmitted) {
      return _buildRequestSubmitted();
    }

    // حالة عرض فورم الخدمة
    if (isServiceRequestForm) {
      return _buildServiceRequestForm();
    }

    // عرض قائمة الإجراءات السريعة
return QuickActionsList(
      onReportPressed: () {
        setState(() {
          isReportFormVisible = true;
        });
      },
      onServiceRequestPressed: () {
        setState(() {
          isServiceRequestForm = true;
        });
      },
      onRequestsPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RequestsView()),
        );
      },
    );  }

  Widget _buildReportSubmitted() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 25),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(kMainColor).withOpacity(0.5), 
              spreadRadius: 3,
              blurRadius: 35, 
              offset: Offset(0, 0), 
            ),
          ],
        ),
        child: Image.asset(
          'assets/imgs/success.png', 
          width: 120, 
          height: 120,
        ),
      ),
      SizedBox(height: 45),
        Text(
          'تم إرسال البلاغ بنجاح!',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 25),
        Text(
          'رقم البلاغ: $reportNumber',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 40),
        CustomGeneralButton(
          onTap: _resetState,
          text: 'العودة إلى القائمة',
        ),
        SizedBox(height: 25),
      ],
    );
  }
Widget _buildRequestSubmitted() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 25),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(kMainColor).withOpacity(0.5), 
              spreadRadius: 3,
              blurRadius: 35, 
              offset: Offset(0, 0), 
            ),
          ],
        ),
        child: Image.asset(
          'assets/imgs/success.png', 
          width: 120, 
          height: 120,
        ),
      ),
      SizedBox(height: 45),
      Text(
        'تم إرسال الطلب بنجاح!',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 25),
      Text(
        'رقم الطلب: $requestSuccess',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      SizedBox(height: 40),
      CustomGeneralButton(
        onTap: _resetState,
        text: 'العودة إلى القائمة',
      ),
      SizedBox(height: 25),
    ],
  );
}
  Widget _buildReportForm() {
    return ReportForm(
      onReportSubmitted: _onReportSubmitted,
      onCancel: _resetState,
    );
  }

  Widget _buildServiceRequestForm() {
    return ServiceRequestForm(
      onRequestSubmitted: _onRequestSubmitted,
      onCancel: _resetState,
    );
  }
}
