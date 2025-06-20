// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ScanQrPage extends StatefulWidget {
//   const ScanQrPage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ScanQrPageState();
// }

// class _ScanQrPageState extends State<ScanQrPage> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR'); 

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() => this.controller = controller);
//     controller.scannedDataStream.listen((scanData) {
//       setState(() => result = scanData);
//     });
//   }

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   void readQr() async {
//     if (result != null) {
//       controller!.pauseCamera();

//       //AppController.to.scanQr(result!.code);
//       controller!.dispose();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     readQr();
//     return Scaffold(
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//         overlay: QrScannerOverlayShape(
//           borderColor: const Color.fromARGB(255, 224, 183, 122),
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: 250,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
