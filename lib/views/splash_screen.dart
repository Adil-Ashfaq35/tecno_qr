import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:technoapp_qr/constants/const_settings.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  StreamSubscription? _intentDataStreamSubscription;
  List<SharedMediaFile>? _sharedFiles;
  String? _sharedText;
  bool isShared = false;
  @override
  void initState() {
    super.initState();

    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
        .listen((List<SharedMediaFile> value) {
        
      _sharedFiles = value;
      //navigationController.navigateToNamed(RouteGenerator.historyScreen);
      isShared = true;
      // setState(() {
      if (kDebugMode) {
        print("Shared:${_sharedFiles?.map((f) => f.path).join(",") ?? ""}");
      }

      setState(() {
             isShared = true;
      });
      _sharedFiles = value;
      // });
    }, onError: (err) {
      if (kDebugMode) {
        print("getIntentDataStream error: $err");
      }
    });

    // For sharing images coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
   //   navigationController.navigateToNamed(RouteGenerator.historyScreen);
      setState(() {
             isShared = true;
      });
 
    });
    isShared
        ?  navigationController.navigateToNamed(RouteGenerator.historyScreen)
        : Timer(const Duration(seconds: ConstantSettings.splashScreenTime),
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
