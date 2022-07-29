import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';

import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/models/history_model.dart';
import 'package:technoapp_qr/models/imagesqr_model.dart';

import '../../models/qr_model.dart';
import 'package:path_provider/path_provider.dart';

class HistoryController extends GetxController {
  static HistoryController instance = Get.find();
  RxList<QRModel> qrList = <QRModel>[].obs;
  RxList<HistoryModel> qrHistory = <HistoryModel>[].obs;
  RxList<QRModel> scanQrs = <QRModel>[].obs;
  RxList<QRModel> readQrs = <QRModel>[].obs;
  List get qrCodes => qrList;
  var images = <QrImage>[].obs;

  RxString currentHistoryImage = ''.obs;

  final box = Hive.box<QRModel>('historyBox');
  @override
  Future<void> onInit() async {
    super.onInit();

    getItem();
    getimageformLocal();
  }

  void setToRecord(String qrData, bool isCamSource) {
    DateTime now = DateTime.now();

    QRModel qrModel = QRModel(qrData, now, isCamSource, false);

    addItem(qrModel);
  }

  addItem(QRModel item) async {
    try {
      box.add(item);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  getItem() async {
    qrList.value = [];
    qrList.value = box.values.toList();
    divisbleQR(qrList);
  }

  updateItem(int index, QRModel inventory) {
    box.putAt(index, inventory);
  }

  deleteItem(int index) {
    box.deleteAt(index);

    getItem();
  }

  divisbleQR(RxList<QRModel> qrList) {
    qrHistory.clear();
    scanQrs.value = [];
    readQrs.value = [];

    for (var element in qrList) {
      if (element.iscreate) {
        scanQrs.add(element);
      } else {
        readQrs.add(element);
      }
    }
    qrHistory.add(HistoryModel(title: 'Scan History', qrsList: scanQrs));
    qrHistory.add(HistoryModel(title: 'Read History', qrsList: readQrs));

    if (kDebugMode) {
      print(qrHistory);
    }
  }

  getimageformLocal() async {
    String path = await getFilePath();
    images.value = [];
    List qrList = qrProvider.createdQrs;
    final imagesDirectory = Directory('$path/');
    final imagesFile = imagesDirectory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".png"))
        .toList(growable: false);
    if (kDebugMode) {
      print(
          "Length of images:${imagesFile.length} \n Length of Created qrs:${qrList.length}");
    }

    for (int index = 0; index < imagesFile.length; index++) {
      final splitted = qrList[index].toString().split('#');
      images.add(QrImage(
          imageName: imagesFile[index],
          isExpanded: false,
          qrName: splitted[1],
          dateString: splitted[0]));
    }
    if (kDebugMode) {
      print("Length  = :${images.length}");
    }
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String filePath = appDocumentsDirectory.path; // 2
    // 3

    return filePath;
  }
}
