import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appbar_design.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    Key? key,
    required this.icon,
    required this.optionText,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String optionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40.sp, 20.sp, 40.sp, 20.sp),
              height: 50.h,
              width: 50.w,
              decoration: CustomWidgets.customDecoration(),
              child: Center(
                  child: Icon(
                icon,
                size: 40.h,
                color: Colors.black,
              )),
            ),
            Text(
              optionText,
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ));
  }
}
