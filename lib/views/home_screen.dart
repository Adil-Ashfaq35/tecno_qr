import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technoapp_qr/constants/controllers.dart';

import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customappBar(title: 'Techno Code'),
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OptionsWidget(
                icon: CupertinoIcons.camera,
                optionText: 'Scan from Camera',
                onTap: () {},
              ),
              OptionsWidget(
                icon: CupertinoIcons.photo,
                optionText: 'Read from Local Storage ',
                onTap: () {},
              ),
              OptionsWidget(
                icon: CupertinoIcons.pen,
                optionText: 'Generate From Text',
                onTap: () {
                  navigationController.navigateToNamed(RouteGenerator.createQr);
                },
              ),
            ]),
      ),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  OptionsWidget({
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
