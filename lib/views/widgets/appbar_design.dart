import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';

class CustomWidgets {
  static AppBar customappBar({
    required String title,
  }) {
    return AppBar(
        leading: const Icon(Icons.menu),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17.0.sp),
        ),
        actions: const [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: AppTheme.lightComponentsColor);
  }

  static BoxDecoration customDecoration() {
    return BoxDecoration(
      color:Colors.amber[50],
      boxShadow: [
      BoxShadow(
        color: Colors.black45.withOpacity(0.25),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ], borderRadius: BorderRadius.circular(10.r));
  }
}
