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
import 'package:share_plus/share_plus.dart';

import '../constants/controllers.dart';
import 'widgets/appbar_design.dart';
import 'widgets/options_widget.dart';

class CreateQrPage extends StatelessWidget {
  final qrKey = GlobalKey();

  CreateQrPage({Key? key}) : super(key: key);

  Future<File?> takeScreenShot() async {
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
            '$directory/${DateTime.now()}${qrProvider.texttoGenerate}.png',
          );
          imgFile.writeAsBytes(pngBytes);
          GallerySaver.saveImage(imgFile.path).then((success) async {
            await qrProvider.createQr(qrProvider.texttoGenerate.value);
          });
    
          return imgFile;
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
      appBar: AppBarWidget(
          title: 'Qr Code',
          iconButton: IconButton(
              onPressed: () {
                navigationController.goBack();
              },
              icon: const Icon(Icons.arrow_back))),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Result QR code',
                style: TextStyle(
                    color: Color.fromARGB(115, 33, 33, 33),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: RepaintBoundary(
                key: qrKey,
                child: QrImage(
                  data: qrProvider.texttoGenerate.value,
                  size: 250,
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                ),
              ),
            ),
            const SizedBox(height: 25),
            OptionsWidget(
              icon: CupertinoIcons.camera,
              optionText: 'Download',
              onTap: () {
                takeScreenShot();
              },
            ),
            OptionsWidget(
              icon: Icons.share,
              optionText: 'Share',
              onTap: () async {
                File? imagefile = await takeScreenShot();
                Share.shareFiles(['${imagefile?.path}/image.jpg'],
                    text: 'Qr Code');
              },
            ),
            // CupertinoButton(
            //   child: const Text("Download"),
            //   onPressed: () => takeScreenShot(qrProvider),
            // ),

            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
