import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/controllers/history_controller.dart';
import 'package:technoapp_qr/core/controllers/navigation_controller.dart';
import 'package:technoapp_qr/core/controllers/qr_provider.dart';
import 'package:technoapp_qr/core/controllers/qr_scan.provider.dart';
import 'package:technoapp_qr/core/controllers/result_controller.dart';
import 'package:technoapp_qr/core/controllers/settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/utils/apptheme.dart';
import 'core/controllers/behaviourController.dart';
import 'core/router/router_generator.dart';
import 'models/language/lnaguage_constant.dart';
import 'models/qr_model.dart';

void main() async {
  InitData initData = await init();

  runApp(MyApp(initdata: initData));
}

const String homeRoute = RouteGenerator.mainSplashScreen;

// const String showDataRoute = RouteGenerator.mainSplashScreen;
Future<InitData> init() async {
  String routeName = homeRoute;

  WidgetsFlutterBinding.ensureInitialized();


  await Hive.initFlutter();
  Hive.registerAdapter((QRModelAdapter()));
  await Hive.openBox('');
  await Hive.openBox<QRModel>('historyBox');
  await Firebase.initializeApp();
  initControllers();
  FirebaseAnalytics.instance.logEvent(name: "app start");
  List<SharedMediaFile>? sharedValue =
      await ReceiveSharingIntent.getInitialMedia();
  if (sharedValue.isNotEmpty) {
    routeName = RouteGenerator.displayImage;
    qrScanProvider.sharedFiles = sharedValue;
    qrScanProvider.fromIntent.value = true;
  }
  return InitData(sharedValue, routeName);
}

void initControllers() {
   Get.put(BehaviourController());
  Get.put(SettingController());
  Get.put(NavigationController());
  Get.put(QrCodeProvider());
  Get.put(ResultController());
  Get.put(QrScanProvider());
  Get.put(HistoryController());
 
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.initdata,
  }) : super(key: key);
  final InitData initdata;
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
     state?.setlocale(newLocale);
  }


}

class _MyAppState extends State<MyApp> {
    // String ?_locale;
    // String ? countryCode;
    Locale? _locale;
    
  StreamSubscription? intentDataStreamSubscription;
  List<SharedMediaFile>? _sharedFiles;
  setlocale(Locale locale) {
    setState(() {
      // _locale = locale.languageCode;
      // countryCode=locale.countryCode;
      _locale =locale;
    behaviourController.IsLtr.value=_locale!.languageCode=='ur'|| _locale!.languageCode=='ar'?false:true;
    });
  }

  final _navkey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream().listen(
        (List<SharedMediaFile> value) {
      if (kDebugMode) {
        print('App is listening');
      }
      if (kDebugMode) {
        print("Shared:${_sharedFiles?.map((f) => f.path).join(",") ?? ""}");
      }
      if (kDebugMode) {
        print(value);
      }
      qrScanProvider.sharedFiles = value;
      qrScanProvider.fromIntent.value = true;
      _navkey.currentState!.pushNamed(RouteGenerator.displayImage);
    }, onError: (err) {
      if (kDebugMode) {
        print("getIntentDataStream error: $err");
      }
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    getLocale().then((value) => {setlocale(value),
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false, 
        navigatorKey: _navkey,
          title: "QR Code",
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale:_locale,
          onGenerateRoute: RouteGenerator.onGeneratedRoutes,
          theme: AppTheme.lightTheme,
          initialRoute: widget.initdata.routeName,
           textDirection: behaviourController.IsLtr.value?TextDirection.ltr:TextDirection.rtl,
        
          //  // '/ScanQr': (_) => const ScanQrPage(),
          // },
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    intentDataStreamSubscription!.cancel();
  }
}

class InitData {
  List<SharedMediaFile>? sharedFiles;
  final String routeName;
  InitData(this.sharedFiles, this.routeName);
}
