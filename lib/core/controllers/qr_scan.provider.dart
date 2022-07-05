import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<bool> qrScan() async {
    qrResult = 'No Result'.obs;
    if (await pickImageGallery() == false) {
      return false;
    }
    String result = '';
    String rawValue = '';

    final InputImage inputImage = InputImage.fromFile(imageFile!);
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
    if (result.isNotEmpty) {
      qrResult.value = rawValue;

      resultController.setResult(qrResult.value,barcodeType,false);
      return true;
    } else {
      return false;
    }
  }
}
