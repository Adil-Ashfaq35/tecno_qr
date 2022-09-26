

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/dialogs/alertDialog.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/language/lnaguage_constant.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key, this.animation,required this.orientation}) : super(key: key);
  final VoidCallback? animation;
  Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.sm),
        child:    AppBarWidget(
            title: translation(context).tecno_Code,
            iconButton: IconButton(

              hoverColor: AppTheme.splashColor,
              disabledColor: Colors.grey[200],
              focusColor: AppTheme.splashColor,
              highlightColor: AppTheme.splashColor,
              splashColor: AppTheme.splashColor,
              splashRadius: 20.r,
              icon: const Icon(Icons.menu),
              onPressed: () {
                animation!();
              },

            ),
            orientation: orientation,
          )
      ),
      body:OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
        return
          orientation==Orientation.portrait?
          Container(
          decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OptionsWidget(
                  icon: CupertinoIcons.camera,
                  optionText: translation(context).scan_Button_Text,
                  onTap: () async {
                    bool isGranted=    await permission(context,true);
                    isGranted ?
                    navigationController.navigateToNamed(RouteGenerator.scanQr):null;

                    FirebaseAnalytics.instance
                        .logEvent(name: "Scan_from_camera", parameters: {
                      "image": "scanning from camera",
                    });
                  },
                  orientation: orientation,
                ),
                OptionsWidget(
                  icon: CupertinoIcons.photo,
                  optionText: '${AppLocalizations.of(context)?.read_Button_Text}',
                  onTap: () async {

                    bool isGranted=   await  permission(context,false);
                    if(isGranted) {
                      FirebaseAnalytics.instance.logEvent(
                        name: "Read_from_local_storage",
                        parameters: {
                          "image": "read_from_local_storage",
                        },
                      );
                      bool isCompleted = await qrScanProvider.pickImage();
                      isCompleted
                          ? navigationController
                          .navigateToNamed(RouteGenerator.displayImage)
                          : null;
                    }


                  },
                  orientation: orientation,
                ),
                OptionsWidget(
                  icon: CupertinoIcons.pen,
                  optionText: translation(context).generate_Button_Text,
                  onTap: () {
                    FirebaseAnalytics.instance.logEvent(
                      name: "Generate_from_text",
                      parameters: {
                        "QrGenerated": "Generated_from_text",
                      },
                    );
                    navigationController
                        .navigateToNamed(RouteGenerator.enterText);
                  },
                  orientation: orientation,
                ),
              ]),
        ): SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OptionsWidget(
                      icon: CupertinoIcons.camera,
                      optionText: translation(context).scan_Button_Text,
                      onTap: () async {
                        bool isGranted=    await permission(context,true);
                        isGranted ?
                        navigationController.navigateToNamed(RouteGenerator.scanQr):null;

                        FirebaseAnalytics.instance
                            .logEvent(name: "Scan_from_camera", parameters: {
                          "image": "scanning from camera",
                        });
                      },
                      orientation: orientation,
                    ),
                    OptionsWidget(
                      icon: CupertinoIcons.photo,
                      optionText: '${AppLocalizations.of(context)?.read_Button_Text}',
                      onTap: () async {

                        bool isGranted=   await  permission(context,false);
                        if(isGranted) {
                          FirebaseAnalytics.instance.logEvent(
                            name: "Read_from_local_storage",
                            parameters: {
                              "image": "read_from_local_storage",
                            },
                          );
                          bool isCompleted = await qrScanProvider.pickImage();
                          isCompleted
                              ? navigationController
                              .navigateToNamed(RouteGenerator.displayImage)
                              : null;
                        }


                      },
                      orientation: orientation,
                    ),
                    OptionsWidget(
                      icon: CupertinoIcons.pen,
                      optionText: translation(context).generate_Button_Text,
                      onTap: () {
                        FirebaseAnalytics.instance.logEvent(
                          name: "Generate_from_text",
                          parameters: {
                            "QrGenerated": "Generated_from_text",
                          },
                        );
                        navigationController
                            .navigateToNamed(RouteGenerator.enterText);
                      },
                      orientation: orientation,
                    ),
                  ]),
            ),
        );
      },

      )

    );
  }

 Future<bool> permission(context,bool isCameraPermission) async {
PermissionStatus allowstatus;
if(isCameraPermission) {
  allowstatus = await Permission.camera.request();
} else {
  
  allowstatus = await Permission.storage.request();
}

    if (allowstatus.isGranted) {
      return true;
    
    } else if (allowstatus.isPermanentlyDenied) {
      if (kDebugMode) {
        print("persmission denied");
      }
      if(isCameraPermission)
      {
      await camCancellationdialog(context);

      }
      else{
            await storageCancellationdialog(context);

      }
      return false;
    } else if (allowstatus.isDenied) {
      if(isCameraPermission)
      {
          await camCancellationdialog(context);
      }
      else{
          await storageCancellationdialog(context);
      }
   return false;
    }
    else {
      return false;
    }
  }

 Future<void> storageCancellationdialog(context) async {
     await showDialog(context: context, builder: (context){
           return DialogWidget(
             title: translation(context).local_Permission_Alert,
             description: translation(context).local_Alert_Description,
             cancelTap: (){
             navigationController.goBack();
             },
             continueTap: () async {
            navigationController.goBack();
     await openAppSettings();
   navigationController.getOffAll(RouteGenerator.customDrawer);
   
             },
           );
         });
 }

 Future<void> camCancellationdialog(context) async {
       await showDialog(
       context: context,
       builder: (context) {
         return DialogWidget(
           title: translation(context).camera_Permission_Alert,
           description: translation(context).camera_Alert_Description,
           cancelTap: () {
             navigationController.goBack();
           },
           continueTap: () async {
             navigationController.goBack();
             await openAppSettings();
           },
         );
       });
 }
}
