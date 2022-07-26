import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';

class QrCodeProvider extends GetxController {
  QrCodeProvider() : super();

  @override
  void onInit() {
    getQrs();
    super.onInit();
  }

  static QrCodeProvider instance = Get.find();
  final box = Hive.box('');

  RxString texttoGenerate = ''.obs;

  List createdQrs = [];
  List scannedQrs = [];
  void setTexttogenerate(String text) {
    texttoGenerate.value = text;
  }

  void getQrs() {
    createdQrs = [];
    createdQrs = box.get('createdQrList') ?? [];
    // scannedQrs = box.get('scannedQrList') ?? [];
  }

  Future<void> createQr(String data) async {
    List tempList = box.get('createdQrList') ?? [];
    box.put('createdQrList', [...tempList, data]);
    createdQrs.add(data);
  }

  Future<void> scanQr(String data) async {
    List tempList = box.get('scannedQrList') ?? [];
    box.put('scannedQrList', [...tempList, data]);
    scannedQrs.add(data);
  }
}
