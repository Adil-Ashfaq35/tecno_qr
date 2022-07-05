

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technoapp_qr/core/controllers/history_controller.dart';
import 'package:technoapp_qr/core/controllers/navigation_controller.dart';
import 'package:technoapp_qr/core/controllers/qr_provider.dart';
import 'package:technoapp_qr/core/controllers/qr_scan.provider.dart';
import 'package:technoapp_qr/core/controllers/result_controller.dart';

import 'constants/utils/apptheme.dart';
import 'core/router/router_generator.dart';
import 'models/qr_model.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
   Hive.registerAdapter((QRModelAdapter()));
  await Hive.openBox('');
  await Hive.openBox<QRModel>('historyBox');
  

  initControllers();
}

void initControllers() {
  Get.put(NavigationController());
  Get.put(QrCodeProvider());
  Get.put(ResultController());
  Get.put(QrScanProvider());
  Get.put(HistoryController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "QR Code",
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        theme: AppTheme.lightTheme,
        initialRoute: RouteGenerator.mainSplashScreen,
        // routes: {
        //   '/Home': (_) =>  HomePage(),
        //    '/CreateQr': (_) => CreateQrPage(),
        //  // '/ScanQr': (_) => const ScanQrPage(),
        // },
      );
    });
  }
}
