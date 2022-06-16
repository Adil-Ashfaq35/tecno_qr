import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QrCodeProvider extends GetxController {
  QrCodeProvider() : super();
  static QrCodeProvider instance = Get.find();
  final box = Hive.box('');

  String? qrData = 'dsdsds';

  List createdQrs = [];
  List scannedQrs = [];

  void getQrs() {
    createdQrs = box.get('createdQrList') ?? [];
    scannedQrs = box.get('scannedQrList') ?? [];
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
