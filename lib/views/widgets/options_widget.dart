import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/utils/apptheme.dart';
import 'appbar_design.dart';

class OptionsWidget extends StatelessWidget {
   OptionsWidget({
    Key? key,
    required this.icon,
    required this.optionText,
    required this.onTap,
    this.orientation
  }) : super(key: key);
  final IconData icon;
  final String optionText;
  final VoidCallback onTap;
  Orientation? orientation;






  @override
  Widget build(BuildContext context) {


    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin:EdgeInsets.fromLTRB(40.sm, 20.sm, 30.sm, 20.sm),

              height:orientation==Orientation.portrait? 50.h:90.h,
              width:orientation==Orientation.portrait? 50.w:30.w,
              decoration: CustomWidgets.customDecoration(),
              child: Center(
                  child: Icon(
                   icon,
                size:orientation==Orientation.portrait? 35.h:55.h,
                color: AppTheme.primaryColor,
              )),
            ),
            SizedBox(
              width: 240.w,
              child: Text(
                  optionText,   overflow: TextOverflow.clip,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize:orientation==Orientation.portrait? 16.sp:13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ));
  }
}
