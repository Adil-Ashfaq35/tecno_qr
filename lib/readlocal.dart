import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;
import 'package:flutter/material.dart';

class ReadLocal extends StatefulWidget {
  const ReadLocal({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReadLocalState createState() => _ReadLocalState();
}

class _ReadLocalState extends State<ReadLocal> {
  File? _imageFile;
  String _mlResult = '<no result>';
  final _picker = ImagePicker();

  Future<bool> _pickImage() async {
    setState(() => _imageFile = null);
    final File? imageFile;
    imageFile = await fromGallery();

    if (mounted && imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    setState(() => _imageFile = imageFile);
    if (kDebugMode) {
      print('picked image: ${this._imageFile}');
    }
    return true;
  }

  Future<File?> fromGallery() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (mounted && pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<void> _imageLabelling() async {
  //   setState(() => this._mlResult = '<no result>');
  //   if (await _pickImage() == false) {
  //     return;
  //   }
  //   String result = '';
  //   final InputImage inputImage = InputImage.fromFile(this._imageFile!);
  //   final ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
  //   final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
  //   result += 'Detected ${labels.length} labels.\n';
  //   for (final ImageLabel label in labels) {
  //     final String text = label.label;
  //     final int entityId = label.index;
  //     final double confidence = label.confidence;
  //     result +=
  //         '\n#Label: $text($entityId), confidence=${confidence.toStringAsFixed(3)}';
  //   }
  //   if (result.isNotEmpty) {
  //     setState(() => this._mlResult = result);
  //   }
  // }

  //  Future<void> _textOcr() async {
  //   setState(() => this._mlResult = '<no result>');
  //   if (await _pickImage() == false) {
  //     return;
  //   }
  //   String result = '';
  //   final InputImage inputImage = InputImage.fromFile(this._imageFile!);
  //   final TextRecognizer textDetector = GoogleMlKit.vision.textRecognizer();
  //   final RecognizedText recognizedText =
  //       await textDetector.processImage(inputImage);
  //   final String text = recognizedText.text;
  //   debugPrint('Recognized text: "$text"');
  //   result += 'Detected ${recognizedText.blocks.length} text blocks.\n';
  //   for (final TextBlock block in recognizedText.blocks) {
  //     final Rect boundingBox = block.boundingBox;
  //     final List<Point<int>> cornerPoints = block.cornerPoints;
  //     final String text = block.text;
  //     final List<String> languages = block.recognizedLanguages;
  //     result += '\n# Text block:\n '
  //         'bbox=$boundingBox\n '
  //         'cornerPoints=$cornerPoints\n '
  //         'text=$text\n languages=$languages';
  //     // for (TextLine line in block.lines) {
  //     //   // Same getters as TextBlock
  //     //   for (TextElement element in line.elements) {
  //     //     // Same getters as TextBlock
  //     //   }
  //     // }
  //   }
  //   if (result.isNotEmpty) {
  //     setState(() => this._mlResult = result);
  //   }
  // }

  Future<void> _barcodeScan() async {
    setState(() => _mlResult = '<no result>');
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final InputImage inputImage = InputImage.fromFile(_imageFile!);
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
      setState(() => _mlResult = result);
    }
  }

  // Future<void> _faceDetect() async {
  //   setState(() => this._mlResult = '<no result>');
  //   if (await _pickImage() == false) {
  //     return;
  //   }
  //   String result = '';
  //   final InputImage inputImage = InputImage.fromFile(this._imageFile!);
  //   final options = FaceDetectorOptions(
  //     enableLandmarks: true,
  //     enableClassification: true,
  //     enableTracking: true,
  //   );
  //   final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(options);
  //   final List<Face> faces = await faceDetector.processImage(inputImage);
  //   result += 'Detected ${faces.length} faces.\n';
  //   for (final Face face in faces) {
  //     final Rect boundingBox = face.boundingBox;
  //     // Head is rotated to the right rotY degrees
  //     final double rotY = face.headEulerAngleY!;
  //     // Head is tilted sideways rotZ degrees
  //     final double rotZ = face.headEulerAngleZ!;
  //     result += '\n# Face:\n '
  //         'bbox=$boundingBox\n '
  //         'rotY=$rotY\n '
  //         'rotZ=$rotZ\n ';
  //     // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
  //     // eyes, cheeks, and nose available):
  //     final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
  //     if (leftEar != null) {
  //       final Point<int> leftEarPos = leftEar.position;
  //       result += 'leftEarPos=$leftEarPos\n ';
  //     }
  //     // If classification was enabled with FaceDetectorOptions:
  //     if (face.smilingProbability != null) {
  //       final double smileProb = face.smilingProbability!;
  //       result += 'smileProb=${smileProb.toStringAsFixed(3)}\n ';
  //     }
  //     // If face tracking was enabled with FaceDetectorOptions:
  //     if (face.trackingId != null) {
  //       final int id = face.trackingId!;
  //       result += 'id=$id\n ';
  //     }
  //   }
  //   if (result.isNotEmpty) {
  //     setState(() => this._mlResult = result);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        if (this._imageFile == null)
          const Placeholder(
            fallbackHeight: 200.0,
          )
        else
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: FileImage(_imageFile!),
            // Image.file(, fit: BoxFit.contain),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: _barcodeScan,
                child: const Text('Barcode Scan'),
              ),
            ],
          ),
        ),
        const Divider(),
        Text('Result:', style: Theme.of(context).textTheme.subtitle2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            _mlResult,
            // style: GoogleFonts.droidSansMono(),
          ),
        ),
      ],
    );
  }
}
