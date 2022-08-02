import 'package:flutter/material.dart';
import 'package:technoapp_qr/readlocal.dart';
import 'package:technoapp_qr/views/custom_drawer.dart';
import 'package:technoapp_qr/views/enter_qr.dart';
import 'package:technoapp_qr/views/history_screen.dart';
import 'package:technoapp_qr/views/home_screen.dart';
import 'package:technoapp_qr/views/image_display.dart';
import 'package:technoapp_qr/views/language.dart';
import 'package:technoapp_qr/views/qr_scan.dart';
import 'package:technoapp_qr/views/result_screen.dart';
import 'package:technoapp_qr/views/splash_screen.dart';
import 'package:technoapp_qr/views/widgets/faq_screen.dart';
import 'package:technoapp_qr/views/widgets/written_texts_screen.dart';

import '../../views/about.dart';
import '../../views/generate_qr.dart';

class RouteGenerator {
  // ignore: todo

  static const String mainSplashScreen = '/main-splash-screen';

  // Drawer
  static const String customDrawer = '/custom-drawer';
  static const String homeScreen = '/home_screen';
  static const String scanQr = '/qr_scan';
  static const String createQr = '/generate_qr';
  static const String readLocal = '/read_local';
  static const String resultScreen = '/result_screen';
  static const String enterText = '/enter_text';
  static const String historyScreen = '/history_screen';
  static const String policyScreen = '/policy_screen';
  static const String faqPage = '/faq_page';
  static const String displayImage = '/image_display';
  static const String aboutScreen = '/about_screen';
  static const String languagePage = '/language_page';


  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    late dynamic args;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }
    debugPrint(settings.name);
    switch (settings.name) {
      case mainSplashScreen:
        return _getPageRoute(const SplashScreen());
      case homeScreen:
        return _getPageRoute(const HomeScreen());
      case createQr:
        return _getPageRoute(CreateQrPage());
      case scanQr:
        return _getPageRoute( ScanQr());
      case readLocal:
        return _getPageRoute(const ReadLocal());
      case resultScreen:
        return _getPageRoute(const ResultScreen());

      case enterText:
        return _getPageRoute(EnterText());
      case customDrawer:
        return _getPageRoute(const CustomDrawer());
      case historyScreen:
        return _getPageRoute(HistoryScreen());
      case policyScreen:
        return _getPageRoute(const PrivacyPolicy());
      case faqPage:
        return _getPageRoute(FAQPage());
      case displayImage:
        return _getPageRoute(const DisplayImage());
      case aboutScreen:
        return _getPageRoute(const AboutScreen());
      case languagePage:
        return _getPageRoute( LanguagePage());
      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: const Center(
          child: Text(''),
        ),
      );
    });
  }
}
