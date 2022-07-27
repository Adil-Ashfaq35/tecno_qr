import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:technoapp_qr/constants/const_settings.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {



  @override
  void initState() {
    super.initState();



    // For sharing images coming from outside the app while the app is closed


        Timer(const Duration(seconds: ConstantSettings.splashScreenTime),
            () => checkState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 224, 214, 214),
            Colors.blueGrey,
            Colors.white
          ],
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.topCenter,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/gif.gif',
          fit: BoxFit.fitHeight,
        ),
      ),
    ));
  }

  checkState() {
navigationController.getOffAll(RouteGenerator.customDrawer);
  }
}
