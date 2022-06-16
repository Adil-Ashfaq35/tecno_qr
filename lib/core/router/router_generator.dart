import 'package:flutter/material.dart';
import 'package:technoapp_qr/views/home_screen.dart';
import 'package:technoapp_qr/views/splash_screen.dart';

import '../../views/generate_qr.dart';

class RouteGenerator {
  // ignore: todo
// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

  static const String mainSplashScreen = '/main-splash-screen';

  // Drawer
  static const String customDrawer = '/custom-drawer';
  static const String homeScreen = '/home_screen';

  static const String createQr = '/generate_qr';

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

      // case customDrawer:
      //   return _getPageRoute(const CustomDrawer());

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
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
