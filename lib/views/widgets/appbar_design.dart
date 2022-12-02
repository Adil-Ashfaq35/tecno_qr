import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';

class CustomWidgets {
  static BoxDecoration customDecoration() {
    return BoxDecoration(
        color: AppTheme.optionWidgetColors,
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.r));
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.title,
    required this.iconButton,
    this.orientation,

    // ignore: non_constant_identifier_names
  }) : super(key: key);

  final String title;
  final IconButton iconButton;
  Orientation? orientation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: iconButton,
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
              fontSize:orientation==Orientation.landscape? 12.sp:20.sp),
        ),
        // actions: const [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
        backgroundColor:  Colors.blueGrey.shade100);

  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
