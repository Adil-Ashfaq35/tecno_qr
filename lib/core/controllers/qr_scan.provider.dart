import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class QrScanProvider extends GetxController{
  QrScanProvider() : super();
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  dynamic pickerError;
  String qrResult = 'No Result';

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

  Future<void> qrScan() async {
    qrResult = 'No Result';
    if (await pickImageGallery() == false) {
      return;
    }
    String result = '';
    final InputImage inputImage = InputImage.fromFile(imageFile!);
    final BarcodeScanner barcodeScanner = BarcodeScanner();

    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);
    result += 'Detected ${barcodes.length} barcodes.\n';
    for (final Barcode barcode in barcodes) {
      final Rect boundingBox = barcode.boundingBox!;
      final String rawValue = barcode.rawValue!;
      final valueType = barcode.type;
      result += '\n# Barcode:\n '
          'bbox=$boundingBox\n '
          'rawValue=$rawValue\n '
          'type=$valueType';
    }
    if (result.isNotEmpty) {
      qrResult = result;

  
    }
  }
}
