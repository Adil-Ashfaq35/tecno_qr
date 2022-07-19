import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';

import '../constants/const_settings.dart';
import '../constants/controllers.dart';
import '../constants/utils/apptheme.dart';
import '../core/router/router_generator.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({Key? key}) : super(key: key);

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  void initState() {
    Timer(const Duration(seconds: ConstantSettings.readFromlocal),
        () => checkState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Techno App',
        iconButton: IconButton(
          // hoverColor: AppTheme.splashColor,
          // disabledColor: Colors.grey[200],
          // focusColor: AppTheme.splashColor,
          // highlightColor: AppTheme.splashColor,
          // splashColor: AppTheme.splashColor,
          // splashRadius: 20.r,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navigationController.getOffAll(RouteGenerator.customDrawer);
          },
        ),
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 0.05.sp, vertical: 30.h),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15.r),
        // ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                //   borderRadius: BorderRadius.circular(10.r),
                child: Image.file(
                  File(qrScanProvider.imageFile!.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      color: Colors.transparent.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: Lottie.asset('assets/lottie/scanning.json',
                          animate: true, height: 200.sh, width: 400.sw),
                    ))),
          ],
        ),
      ),
    );
  }

  checkState() async {
    bool isCompleted = await qrScanProvider.qrScan();
    isCompleted
        ? navigationController.getOffAll(RouteGenerator.resultScreen)
        : Timer(
            const Duration(seconds: ConstantSettings.imageShowTime),
            () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Qr not found in Image')),
                ));
  }
}
