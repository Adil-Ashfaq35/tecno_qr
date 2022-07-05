import 'package:technoapp_qr/core/controllers/history_controller.dart';
import 'package:technoapp_qr/core/controllers/qr_provider.dart';
import 'package:technoapp_qr/core/controllers/qr_scan.provider.dart';
import 'package:technoapp_qr/core/controllers/result_controller.dart';

import '../core/controllers/navigation_controller.dart';

NavigationController navigationController = NavigationController.instance;
QrCodeProvider qrProvider = QrCodeProvider.instance;
ResultController resultController = ResultController.instance;
QrScanProvider qrScanProvider = QrScanProvider.instance;
HistoryController historyController = HistoryController.instance;
