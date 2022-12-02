import 'dart:io';

  import 'dart:ui' as ui;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';

import '../constants/controllers.dart';
import '../constants/utils/apptheme.dart';
import '../models/language/lnaguage_constant.dart';
import 'widgets/appbar_design.dart';
import 'widgets/options_widget.dart';

class CreateQrPage extends StatelessWidget {
  final qrKey = GlobalKey();

  CreateQrPage({Key? key}) : super(key: key);

  Future<File?> takeScreenShot(context, show) async {
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
          String formattedDate =
              DateFormat('yyyy-MM-dd – kk:mm a').format(DateTime.now());

          final imgFile = File(
            '$directory/$formattedDate.png',
          );

          imgFile.writeAsBytes(pngBytes);
          GallerySaver.saveImage(imgFile.path).then((success) async {
            await qrProvider.createQr(
                "$formattedDate # ${qrProvider.texttoGenerate.value}");
            show
                ? Get.snackbar(
                    'File Downloaded',
                    'Your file is Downloaded to $directory',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  )
                : null;
            FirebaseAnalytics.instance
                .logEvent(name: "Downloaded_the_qr", parameters: {
              "downloaded_code": "generated_from_text",
            });
          });

          return imgFile;
        } else {
          return null;
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
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return
        Scaffold(
          appBar: PreferredSize(
            
            preferredSize: Size.fromHeight(50.sm),
            child: AppBarWidget(
                title: translation(context).qr_Code,
                iconButton: IconButton(
                    onPressed: () {
                      navigationController.flowFromhistory.value
                          ? navigationController.goBack()
                          : navigationController
                          .getOffAll(RouteGenerator.customDrawer);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: AppTheme.primaryColor,
                    )),
            orientation: orientation,
            ),
          ),
          body: SafeArea(
            child:
            SingleChildScrollView(    child:        Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${translation(context).result_Language_Label} ${translation(context).qr_Code}",
                    style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: RepaintBoundary(
                    key: qrKey,
                    child: navigationController.flowFromhistory.value
                        ? Image.file(
                      File(historyController.currentHistoryImage.value),
                      height: 0.4.sh,
                      width: 0.75.sw,
                    )
                        : QrImage(
                      data: qrProvider.texttoGenerate.value,
                      size: 250,
                      backgroundColor: Colors.white,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                OptionsWidget(
                  icon: CupertinoIcons.down_arrow,
                  optionText: translation(context).download_Button_Text,
                  onTap: () {
                    if (behaviourController.isClicked.value == false) {
                      behaviourController.disableButton();
                      takeScreenShot(context, true);
                    }
                    else{
                      if (kDebugMode) {
                        print("tab is delayed and file is already downloaded");
                      }
                    }
                  },
                  orientation: orientation,
                ),
                OptionsWidget(
                  icon: Icons.share,
                  optionText: translation(context).share_Button_Text,
                  onTap: () async {
                    File? imagefile = await takeScreenShot(context, false);
                      Share.shareFiles([(imagefile!.path)], text: 'Qr Code');
                    FirebaseAnalytics.instance
                        .logEvent(name: "share_qr", parameters: {
                      "qr_shared": "shared_gen_qr",
                    });
                  },
                  orientation: orientation,
                ),
                // CupertinoButton(
                //   child: const Text("Download"),
                //   onPressed: () => takeScreenShot(qrProvider),
                // ),

                const SizedBox(height: 25)
              ],
            ),
            ),
          ),
        );
      },

    );
  }
}
