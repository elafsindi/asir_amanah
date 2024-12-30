import 'dart:io';

import 'package:asir_amanah/core/constants.dart';
import 'package:asir_amanah/core/widgets/attach_image_button.dart';
import 'package:asir_amanah/core/widgets/space_widget.dart';
import 'package:asir_amanah/features/home/presentation/widgets/issue_description_field.dart';
import 'package:asir_amanah/features/home/presentation/widgets/issue_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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

  const ReportForm(
      {required this.onReportSubmitted, required this.onCancel, Key? key})
      : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  String selectedIssueType = 'اختيار نوع البلاغ';
  String description = '';
  File? _image;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await showModalBottomSheet<XFile>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('التقاط صورة بالكاميرا'),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile =
                    await picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('اختيار صورة من المعرض'),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

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
              onPressed: widget.onCancel,
            ),
            SizedBox(width: 8),
            Text(
              'الإبلاغ عن مشكلة',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Call the IssueTypeDropdown widget
        IssueTypeDropdown(
          selectedIssueType: selectedIssueType,
          onChanged: (value) {
            setState(() {
              selectedIssueType = value;
            });
          },
        ),

        SizedBox(height: 16),

        // Call the IssueDescriptionField widget
        IssueDescriptionField(
          description: description,
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
        ),

        SizedBox(height: 16),

        // Call the AttachImageButton widget
        AttachImageButton(
          image: _image,
          onPickImage: _pickImage,
        ),

        SizedBox(height: 16),

        // Submit button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
