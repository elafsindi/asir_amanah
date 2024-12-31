import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/home/presentation/widgets/blurred_container.dart';
import 'package:asir_amanah/features/home/presentation/widgets/quick_actions.dart';
import 'package:asir_amanah/features/home/presentation/widgets/service_request_form.dart';
import 'package:asir_amanah/features/requests/presentation/requests_view.dart';
import 'package:flutter/material.dart';
import 'package:asir_amanah/features/home/presentation/widgets/report_form.dart';
import 'package:asir_amanah/features/home/presentation/widgets/menu_header.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool isReportIssueSelected = false;
  bool isReportSubmitted = false;

  bool isServiceRequestForm = false;
  bool isRequestSubmitted = false;

  String reportNumber = '';
  String requestSuccess = '';

  // إدارة اختيار من القائمة
void _handleMenuSelection(int value) {
  setState(() {
    if (value == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
    } 
    else if (value == 1) {
      isReportIssueSelected = true;
      isServiceRequestForm = false;
    } 
    else if (value == 2) {
      isServiceRequestForm = true;
      isReportIssueSelected = false;
    }
    else if (value == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RequestsView(),
        ),
      );
    }
  });
}

  // إرسال البلاغ بنجاح
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
            // منطقة العرض مع التمويه
            BlurredContainer(
              child: Column(
                children: [
                  if (isReportIssueSelected)
                    ReportForm(
                      onReportSubmitted: (String reportNumber) {
                        setState(() {
                          isReportIssueSelected = false;
                        });
                      },
                      onCancel: () {
                        setState(() {
                          isReportIssueSelected = false;
                        });
                      },
                    ),
                  if (isServiceRequestForm)
                    ServiceRequestForm(
                      onRequestSubmitted: (String requestSuccess) {
                        setState(() {
                          isServiceRequestForm = false;
                        });
                      },
                      onCancel: () {
                        setState(() {
                          isServiceRequestForm = false;
                        });
                      },
                    ),
                  if (!isReportIssueSelected && !isServiceRequestForm)
                    QuickActions(onMenuSelected: _handleMenuSelection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
