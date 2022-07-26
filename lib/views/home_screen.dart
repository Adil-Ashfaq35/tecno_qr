import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:technoapp_qr/constants/controllers.dart';

import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/language/lnaguage_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.animation}) : super(key: key);
  final VoidCallback? animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: translation(context).techno_App,
        iconButton: IconButton(
          hoverColor: AppTheme.splashColor,
          disabledColor: Colors.grey[200],
          focusColor: AppTheme.splashColor,
          highlightColor: AppTheme.splashColor,
          splashColor: AppTheme.splashColor,
          splashRadius: 20.r,
          icon:const Icon(Icons.menu),
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
                optionText: translation(context).scan_From_Camera,
                onTap: () async {
                  navigationController.navigateToNamed(RouteGenerator.scanQr);
                  FirebaseAnalytics.instance.logEvent(name: "Scan_from_camera",
                  parameters: {
                    "image":"scanning from camera",
                  }
                  );
                },
              ),
              OptionsWidget(
                icon: CupertinoIcons.photo,
                optionText: '${AppLocalizations.of(context)?.read_From_Local_Storage}',
                onTap: () async {
                  FirebaseAnalytics.instance.logEvent(name: "Read_from_local_storage",
                  parameters: {
                    "image":"read_from_local_storage",
                  },
                  );
                  bool isCompleted = await qrScanProvider.pickImage();
                  isCompleted
                      ? navigationController
                          .navigateToNamed(RouteGenerator.displayImage)
                      : null;
                },
              ),
              OptionsWidget(
                icon: CupertinoIcons.pen,
                optionText: translation(context).generate_From_Text,
                onTap: () {
                  FirebaseAnalytics.instance.logEvent(name: "Generate_from_text",
                    parameters: {
                      "QrGenerated":"Generated_from_text",
                    },
                  );
                  navigationController
                      .navigateToNamed(RouteGenerator.enterText);
                },
              ),
            ]),
      ),
    );
  }
}
