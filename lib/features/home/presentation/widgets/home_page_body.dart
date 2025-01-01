import 'package:asir_amanah/features/Auth/presentation/pages/login/login_view.dart';
import 'package:asir_amanah/features/home/presentation/widgets/MapWidget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapWidget(),
          Column(
            children: [
              MenuHeader(onMenuSelection: _handleMenuSelection),
              Spacer(),

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
        ],
      ),
    );
  }

  void _handleMenuSelection(int value) {
    setState(() {
      if (value == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      } else if (value == 1) {
        isReportIssueSelected = true;
        isServiceRequestForm = false;
      } else if (value == 2) {
        isServiceRequestForm = true;
        isReportIssueSelected = false;
      } else if (value == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestsView(),
          ),
        );
      }
    });
  }
}
