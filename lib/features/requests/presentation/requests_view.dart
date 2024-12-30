import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/features/requests/presentation/widgets/requests_view_body.dart';
import 'package:flutter/material.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kBackground),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 10), 
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 39, 63, 82),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("تتبع البلاغات الخاصة"),
          ),
        ),
      ),
      body: RequestsViewBody(),
    );
  }
}