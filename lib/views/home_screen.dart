import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:technoapp_qr/constants/controllers.dart';

import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.animation}) : super(key: key);
  final VoidCallback? animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Techno App',
        iconButton: IconButton(
          hoverColor: AppTheme.splashColor,
          disabledColor: Colors.grey[200],
          focusColor: AppTheme.splashColor,
          highlightColor: AppTheme.splashColor,
          splashColor: AppTheme.splashColor,
          splashRadius: 20.r,
          icon: Icon(Icons.menu),
          onPressed: () {
            animation!();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OptionsWidget(
                icon: CupertinoIcons.camera,
                optionText: 'Scan from Camera',
                onTap: () {
                  navigationController.navigateToNamed(RouteGenerator.scanQr);
                },
              ),
              OptionsWidget(
                icon: CupertinoIcons.photo,
                optionText: 'Read from Local Storage ',
                onTap: () async {
                  bool isCompleted = await qrScanProvider.pickImage();
                  isCompleted
                      ? navigationController
                          .navigateToNamed(RouteGenerator.displayImage)
                      : null;
                },
              ),
              OptionsWidget(
                icon: CupertinoIcons.pen,
                optionText: 'Generate From Text',
                onTap: () {
                  navigationController
                      .navigateToNamed(RouteGenerator.enterText);
                },
              ),
            ]),
      ),
    );
  }
}
