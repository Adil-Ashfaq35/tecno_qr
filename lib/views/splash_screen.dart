import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () => checkState());
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
