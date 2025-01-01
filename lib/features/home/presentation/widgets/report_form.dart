import 'package:asir_amanah/features/home/presentation/widgets/attach_image_button.dart';
import 'package:asir_amanah/features/home/presentation/widgets/issue_description_field.dart';
import 'package:asir_amanah/features/home/presentation/widgets/issue_type_dropdown.dart';
import 'package:asir_amanah/features/onBoarding/presentation/widgets/custom_bottons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  String selectedIssueType = 'اختر نوع البلاغ';
  String description = '';
  File? _image;

  void _pickImage() async {
    final picker = ImagePicker();
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: CupertinoActionSheet(
            title: Text(
              'اختر طريقة إرفاق الصورة',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(CupertinoIcons.camera, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'التقاط صورة بالكاميرا',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(CupertinoIcons.photo, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'اختيار صورة من المعرض',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'إلغاء',
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ),
            ),
          ),
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
          labelText: 'اختر نوع البلاغ',
          items: [
            'اختر نوع البلاغ',
            'بلاغ نظافة',
            'بلاغ تسرب مياه',
            'بلاغ إنارة',
            'بلاغ إشغالات',
            'بلاغ تطوير طرق',
            'بلاغ مخالفات بناء',
            'بلاغ حشرات أو آفات',
            'بلاغ خدمية عامة',
          ],
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
          labelText: 'وصف البلاغ',
          hintText: 'ادخل وصف البلاغ ...',
        ),

        SizedBox(height: 16),

        // Call the AttachImageButton widget
        AttachImageButton(
          image: _image,
          onPickImage: _pickImage,
        ),

        SizedBox(height: 25),

        // CustomGeneralButton instead of ElevatedButton
        CustomGeneralButton(
          text: 'تقديم البلاغ',
          onTap: () {
            final reportNumber =
                "BLG${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";
            widget.onReportSubmitted(reportNumber);
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
