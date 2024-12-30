import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatefulWidget {
  final Function(int) onMenuSelected;

  QuickActions({required this.onMenuSelected});

  @override
  _QuickActionsState createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  bool isReportFormVisible = false;
  bool isReportSubmitted = false; // حالة إرسال البلاغ
  String reportNumber = '';

  void _onReportSubmitted(String reportNumber) {
    setState(() {
      this.reportNumber = reportNumber;
      isReportSubmitted = true; // عرض صفحة النجاح
    });
  }

  void _resetState() {
    setState(() {
      isReportFormVisible = false;
      isReportSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isReportSubmitted) {
      // صفحة نجاح البلاغ
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تم إرسال البلاغ بنجاح!',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'رقم البلاغ: $reportNumber',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _resetState, // العودة إلى الإجراءات السريعة
            child: Text('العودة إلى القائمة'),
          ),
        ],
      );
    }

    if (isReportFormVisible) {
      // فورم البلاغ
      return ReportForm(
        onReportSubmitted: _onReportSubmitted,
        onCancel: () {
          setState(() {
            isReportFormVisible = false; // العودة إلى قائمة الإجراءات
          });
        },
      );
    }

    // قائمة الإجراءات السريعة
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الخدمات السريعة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        TextButton.icon(
          onPressed: () {
            setState(() {
              isReportFormVisible = true; // عرض فورم البلاغ
            });
          },
          icon: Icon(Icons.report_problem, color: Colors.white),
          label: Text(
            'الإبلاغ عن مشكلة',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
        Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
        TextButton.icon(
          onPressed: () => widget.onMenuSelected(2),
          icon: Icon(Icons.track_changes, color: Colors.white),
          label: Text(
            'متابعة الطلبات',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
        Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
        TextButton.icon(
          onPressed: () => widget.onMenuSelected(3),
          icon: Icon(Icons.request_page, color: Colors.white),
          label: Text(
            'تقديم طلب خدمة',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
      ],
    );
  }
}
class ReportForm extends StatefulWidget {
  final Function(String) onReportSubmitted;
  final VoidCallback onCancel;

  const ReportForm({required this.onReportSubmitted, required this.onCancel, Key? key})
      : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  String selectedIssueType = 'اختيار نوع البلاغ';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with back button and title
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
              onPressed: widget.onCancel, // العودة إلى الإجراءات السريعة
            ),
            SizedBox(width: 8),
            Text(
              'الإبلاغ عن مشكلة',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Issue type dropdown
        InputDecorator(
          decoration: InputDecoration(
            labelText: 'اختيار نوع البلاغ',
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(kMainColor).withOpacity(0.5)),
            ),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedIssueType,
            onChanged: (String? newValue) {
              setState(() {
                selectedIssueType = newValue!;
              });
            },
            items: ['اختيار نوع البلاغ', 'مشكلة تقنية', 'مشكلة في الخدمة', 'مشكلة في الطلب']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            dropdownColor: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 16),

        // Description TextField
        TextField(
          decoration: InputDecoration(
            labelText: 'وصف البلاغ',
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
            ),
          ),
          maxLines: 4,
          onChanged: (value) => description = value,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),

        // Submit button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, // background color
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            final reportNumber =
                "BLG${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";
            widget.onReportSubmitted(reportNumber);
          },
          child: Text('تقديم البلاغ', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
