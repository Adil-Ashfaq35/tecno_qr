import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:technoapp_qr/core/controllers/history_controller.dart';
import 'package:technoapp_qr/core/controllers/navigation_controller.dart';
import 'package:technoapp_qr/core/controllers/qr_provider.dart';
import 'package:technoapp_qr/core/controllers/qr_scan.provider.dart';
import 'package:technoapp_qr/core/controllers/result_controller.dart';
import 'package:technoapp_qr/core/controllers/settings_controller.dart';

import 'constants/utils/apptheme.dart';
import 'core/router/router_generator.dart';
import 'models/qr_model.dart';

void main() async {
  InitData initData= await init();

  runApp( MyApp(initData:initData ));
}

const String homeRoute = RouteGenerator.mainSplashScreen;

Future<InitData> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter((QRModelAdapter()));
  await Hive.openBox('');
  await Hive.openBox<QRModel>('historyBox');
  await Firebase.initializeApp();
  initControllers();
  FirebaseAnalytics.instance.logEvent(name: "app start");

  String sharedText = "";
  String routeName = homeRoute;
  //When application is closed
  await ReceiveSharingIntent.getInitialMedia();
  return InitData(sharedText, routeName);
}

void initControllers() {
  Get.put(SettingController());
  Get.put(NavigationController());
  Get.put(QrCodeProvider());
  Get.put(ResultController());
  Get.put(QrScanProvider());
  Get.put(HistoryController());
}

class MyApp extends StatelessWidget {
  const  MyApp({Key? key, required this.initData}) : super(key: key);
   final InitData initData;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,

        title: "QR Code",
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        theme: AppTheme.lightTheme,
        initialRoute: RouteGenerator.mainSplashScreen,

        //  // '/ScanQr': (_) => const ScanQrPage(),
        // },
      );
    });
  }
}

class InitData {
  final String sharedMedia;
  final String routeName;

  InitData(this.sharedMedia, this.routeName);
}
