import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/controllers/qr_provider.dart';
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
              margin:EdgeInsets.fromLTRB(40.sm, 20.sm, 30.sm, 20.sm),

              height: 50.h,
              width: 50.w,
              decoration: CustomWidgets.customDecoration(),
              child: Center(
                  child: Icon(
                   icon,
                size: 35.h,
                color: Colors.white,
              )),
            ),
            SizedBox(
              width: 260.sm,
              child: Text(
                  optionText,   overflow: TextOverflow.clip,
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ));
  }
}
