

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/result_screen.dart';
import 'package:technoapp_qr/views/widgets/dialogs/alertDialog.dart';



class ScanQr extends StatefulWidget {
  @override
  State<ScanQr> createState() => _ScanQrState();
}


class _ScanQrState extends State<ScanQr> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  void initState() {
    permission();
    // TODO: implement initState
    super.initState();
  }

  permission() async {
    PermissionStatus;
    PermissionStatus allow=  await Permission.camera.request();
    if(allow.isGranted){
      if (kDebugMode) {
        print("permission granted");
      }
      else{
        print("permission denied");
      }
    }
    else if (allow.isPermanentlyDenied){
      if (kDebugMode) {
        print("persmission denied");
      }
      await showDialog(context: context, builder: (context){
        return DialogWidget(
          title: translation(context).camera_Permission_Alert,
          description: translation(context).camera_Alert_Description,
          cancelTap: (){
            Get.back();
          },
          continueTap: () async {
            Get.back();
            await openAppSettings();

          },
        );
      });
    }
    else if(allow.isDenied){
      await  DialogWidget(
        title:  translation(context).camera_Permission_Alert,
        description:  translation(context).camera_Alert_Description,
        cancelTap: (){
          Get.back();
        },
        continueTap: () async {
          Get.back();
          await openAppSettings();

        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title:  Text(translation(context).scan_Button_Text,
              style: const TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              color: Colors.amber,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
                color: Colors.white,
                icon: ValueListenableBuilder(
                  valueListenable: cameraController.cameraFacingState,
                  builder: (context, state, child) {
                    switch (state as CameraFacing) {
                      case CameraFacing.front:
                        return const Icon(Icons.camera_front);
                      case CameraFacing.back:
                        return const Icon(Icons.camera_rear);
                    }
                  },
                ),
                iconSize: 32.0,
                onPressed: () {
                  cameraController.switchCamera();
                }),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  if (true) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      resultController.setResult(code, barcode.type, true);
                      debugPrint('Barcode found! $code');
                            navigationController.flowFromhistory.value = false;
                      navigationController
                          .navigateToNamed(RouteGenerator.resultScreen);
                                             dispose();
                    }

                  }
                }),
            ClipRRect(
                // Clip it cleanly.
                child: Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/lottie/scanning.json',
                animate: true,
                height: 300.sh,
                width: 400.sw,
              ),
            )),
          ],
        ));
  }

  @override
  void dispose() {
    cameraController.dispose();

  }
}
