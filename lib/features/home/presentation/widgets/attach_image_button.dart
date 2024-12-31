import 'dart:io';
import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class AttachImageButton extends StatelessWidget {
  final File? image;
  final VoidCallback onPickImage;

  AttachImageButton({required this.image, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إرفاق صورة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8),
        GestureDetector(
          onTap: onPickImage,
          child: Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              border: Border.all(
                color: Color(kMainColor),
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image == null
                    ? Icon(
                        Icons.camera_alt_outlined,
                        color: Color(kMainColor),
                        size: 30.0,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 70.0,
                        ),
                      ),
                SizedBox(height: 8),
                // إخفاء النص عند إضافة الصورة
                if (image == null)
                  Text(
                    'JPEG (JPG) - PNG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
