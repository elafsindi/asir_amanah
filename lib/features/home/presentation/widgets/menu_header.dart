import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  final Function(int) onMenuSelection;

  const MenuHeader({required this.onMenuSelection, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFF48677B).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PopupMenuButton<int>(
                  color: Color(0xFF48677B).withOpacity(0.9),
                  icon: Icon(Icons.grid_view, color: Colors.white, size: 20),
                  onSelected: onMenuSelection,
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<int>(value: 0, child: Text('تسجيل الدخول')),
                    PopupMenuItem<int>(value: 1, child: Text('الإبلاغ عن مشكلة')),
                    PopupMenuItem<int>(value: 2, child: Text('متابعة الطلبات')),
                    PopupMenuItem<int>(value: 3, child: Text('تقديم طلب خدمة')),
                  ],
                ),
                SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/imgs/avatar.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'مرحبا، إيلاف',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
