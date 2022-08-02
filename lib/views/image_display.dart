import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import '../constants/const_settings.dart';
import '../constants/controllers.dart';
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
        title: translation(context).tecno_Code,
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
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              //   borderRadius: BorderRadius.circular(10.r),
              child: Image.file(
                File(qrScanProvider.fromIntent.value
                    ? qrScanProvider.sharedFiles![0].path
                    : qrScanProvider.imageFile!.path),
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
    );
  }

  checkState() async {
    bool isCompleted = await qrScanProvider.qrScan();
    if (isCompleted) {
      navigationController.flowFromhistory.value = false;
      navigationController.getOffAll(RouteGenerator.resultScreen);
    } else {
      Timer(
          const Duration(seconds: ConstantSettings.imageShowTime),
          () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(translation(context).qr_Not_Found_In_Image)),
              ));
    }
  }
}
