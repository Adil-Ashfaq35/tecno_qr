import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technoapp_qr/core/controllers/history_controller.dart';
import 'package:technoapp_qr/core/controllers/navigation_controller.dart';
import 'package:technoapp_qr/core/controllers/qr_provider.dart';
import 'package:technoapp_qr/core/controllers/qr_scan.provider.dart';
import 'package:technoapp_qr/core/controllers/result_controller.dart';
import 'package:technoapp_qr/core/controllers/settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/utils/apptheme.dart';
import 'core/router/router_generator.dart';
import 'models/language/lnaguage_constant.dart';
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
  await Firebase.initializeApp();
  initControllers();
  FirebaseAnalytics.instance.logEvent(name: "app start");
}

void initControllers() {
  Get.put(SettingController());
  Get.put(NavigationController());
  Get.put(QrCodeProvider());
  Get.put(ResultController());
  Get.put(QrScanProvider());
  Get.put(HistoryController());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }


}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    Locale locale= await getLocale();
    setLocale(locale);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "QR Code",
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        theme: AppTheme.lightTheme,
        initialRoute: RouteGenerator.mainSplashScreen,
        //  // '/ScanQr': (_) => const ScanQrPage(),
        // },
      );
    });
  }
}
