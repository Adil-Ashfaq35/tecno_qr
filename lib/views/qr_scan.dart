

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/apptheme.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({Key? key}) : super(key: key);

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: "scan from camera");
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: const Text('Scan from Camera',
              style: TextStyle(color: Colors.white)),
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
                  if (mounted) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      resultController.setResult(code, barcode.type, true);
                      debugPrint('Barcode found! $code');
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

    super.dispose();
  }
}
