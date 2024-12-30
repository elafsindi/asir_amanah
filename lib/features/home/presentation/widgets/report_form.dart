import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ReportForm extends StatefulWidget {
  final Function(String) onReportSubmitted;

  const ReportForm({required this.onReportSubmitted, Key? key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  String selectedIssueType = 'اختيار نوع البلاغ';
  String description = '';
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _submitReport() {
    final reportNumber = "BLG${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";
    widget.onReportSubmitted(reportNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
              onPressed: () {
                // العودة إلى قائمة الإجراءات السريعة داخل نفس الصفحة
                // Navigator.pop(context); // يمكن إزالة هذه السطر إذا لم نرغب في العودة فورا
              },
            ),
            SizedBox(width: 8),
            Text(
              'الإبلاغ عن مشكلة',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),
        DropdownButton<String>(
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
              child: Text(value, style: TextStyle(color: const Color.fromARGB(255, 62, 59, 59))),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(labelText: 'وصف البلاغ'),
          maxLines: 4,
          onChanged: (value) => description = value,
        ),
        SizedBox(height: 16),
        ElevatedButton(onPressed: _pickImage, child: Text('إرفاق صورة للبلاغ')),
        if (_image != null)
          Image.file(File(_image!.path), height: 200, width: 200),
        SizedBox(height: 16),
        ElevatedButton(onPressed: _submitReport, child: Text('تقديم البلاغ')),
      ],
    );
  }
}
