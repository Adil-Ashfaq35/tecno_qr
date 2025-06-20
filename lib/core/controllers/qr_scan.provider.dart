import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'dart:io';

import 'package:technoapp_qr/constants/controllers.dart';

class QrScanProvider extends GetxController {
  QrScanProvider() : super();
  static QrScanProvider instance = Get.find();
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  dynamic pickerError;
  RxString qrResult = 'No Result'.obs;
  Rx<BarcodeType> barcodeType = BarcodeType.text.obs;
  List<SharedMediaFile>? sharedFiles;
  RxBool fromIntent = false.obs;
  Future<bool> pickImageGallery() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);
      return true;
    } on Exception catch (e) {
      pickerError = e;
      return false;
    }
  }

  Future<bool> pickImage() async {
    if (await pickImageGallery() == false) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> qrScan() async {
    qrResult = 'No Result'.obs;

    String result = '';
    String rawValue = '';
  InputImage inputImage=  getInputImage();
    final BarcodeScanner barcodeScanner = BarcodeScanner();

    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);
    result += 'Detected ${barcodes.length} barcodes.\n';
    for (final Barcode barcode in barcodes) {
      final Rect boundingBox = barcode.boundingBox!;
      rawValue = barcode.rawValue!;
      final valueType = barcode.type;

      barcodeType.value = valueType;

      result += '\n# Barcode:\n '
          'bbox=$boundingBox\n '
          'rawValue=$rawValue\n '
          'type=$valueType';
    }
    if (rawValue.isNotEmpty) {
      qrResult.value = rawValue;

      resultController.setResult(qrResult.value, barcodeType, false);
      return true;
    } else {
      return false;
    }
  }

  InputImage getInputImage() {
    if (fromIntent.value) {
      final InputImage inputImage =
          InputImage.fromFilePath(sharedFiles![0].path);

      return inputImage;
    } else {
      final InputImage inputImage = InputImage.fromFile(imageFile!);
      return inputImage;
    }
  }
}
