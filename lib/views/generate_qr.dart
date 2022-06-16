import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants/controllers.dart';

class CreateQrPage extends StatelessWidget {
  final qrKey = GlobalKey();

  CreateQrPage({Key? key}) : super(key: key);

  takeScreenShot(ref) async {
    PermissionStatus res;
    try {
      res = await Permission.storage.request();
      if (res.isGranted) {
        final boundary =
            // ignore: use_build_context_synchronously
            qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        final image = await boundary.toImage(pixelRatio: 5.0);
        final byteData =
            await (image.toByteData(format: ui.ImageByteFormat.png));
        if (byteData != null) {
          final pngBytes = byteData.buffer.asUint8List();
          final directory = (await getApplicationDocumentsDirectory()).path;
          final imgFile = File(
            '$directory/${DateTime.now()}${ref.qrData!}.png',
          );
          imgFile.writeAsBytes(pngBytes);
          GallerySaver.saveImage(imgFile.path).then((success) async {
            await ref.createQr(ref.qrData!);
          });
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            Center(
              child: RepaintBoundary(
                key: qrKey,
                child: QrImage(
                  data: qrProvider.qrData!,
                  size: 250,
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CupertinoButton(
              child: const Text("Download"),
              onPressed: () => takeScreenShot(qrProvider),
            ),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
