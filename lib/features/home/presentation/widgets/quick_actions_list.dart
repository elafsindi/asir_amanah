import 'package:asir_amanah/core/constants.dart';
import 'package:flutter/material.dart';

class QuickActionsList extends StatelessWidget {
  final VoidCallback onReportPressed; // هنا نحدد أن الدالة من نوع VoidCallback
  final VoidCallback onServiceRequestPressed; // هنا نحدد أن الدالة من نوع VoidCallback
  final VoidCallback onRequestsPressed; // هنا نحدد أن الدالة من نوع VoidCallback

  QuickActionsList({
    required this.onReportPressed,
    required this.onServiceRequestPressed,
    required this.onRequestsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الخدمات السريعة',
            style: TextStyle(
              color: Color(kMainColor), // استخدم الكود الخاص باللون الرئيسي
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 16),
          _buildQuickActionButton(
            icon: Icons.report_problem,
            label: 'الإبلاغ عن مشكلة',
            onPressed: onReportPressed, 
          ),
          
          Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
          _buildQuickActionButton(
            icon: Icons.receipt,
            label: 'تقديم طلب خدمة',
            onPressed: onServiceRequestPressed, 
          ),
          Divider(color: Colors.white.withOpacity(0.5), thickness: 1),
          _buildQuickActionButton(
            icon: Icons.track_changes,
            label: 'متابعة الطلبات',
            onPressed: onRequestsPressed, 
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}
