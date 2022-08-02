import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/constants/utils/shared_pref.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/views/widgets/dialogs/customDialog.dart';
import '../constants/const_settings.dart';
import '../constants/utils/apptheme.dart';
import '../models/language/lnaguage_constant.dart';

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

    initRouting();
  }

  Future<void> initRouting() async {
    bool isFirstTime = await SharedPref().readBool('isFirsttime');

         isFirstTime
        ? forFirstTime()
        : navigationController.navigateToNamed(RouteGenerator.customDrawer);

    // For sharing images coming from outside the app while the app is closed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Color.fromARGB(255, 224, 214, 214),
      //       Colors.blueGrey,
      //       Colors.white
      //     ],
      //     begin: FractionalOffset.bottomLeft,
      //     end: FractionalOffset.topCenter,
      //   ),
      // ),
  //     child: Center(
  //       child: Image.asset(
  //         'assets/images/gif.gif',
  //         fit: BoxFit.fitHeight,
  //       ),
  //     ),
    ));
  }

  checkState() {
    navigationController.getOffAll(RouteGenerator.customDrawer);
  }

  Future<void> forFirstTime() async {
    bool isnetavailable = await settingController.checkInternet();
    if (isnetavailable) {

      showDialog(

        context: context,
        barrierDismissible: false,
        // ignore: prefer_const_constructors
        builder: (_) => CustomDialogBox(
          title: '',
          text: 'Continue',
          descriptions:translation(context).privacy_Policy_Confirmation,
          onPressed: () async {
            settingController.addDocument();

                await SharedPref().saveBool('isFirsttime', false);

            navigationController.getOffAll(RouteGenerator.customDrawer);



          },
        ),
      );
    } else {
      showDialog(
        context: context,
        // ignore: prefer_const_constructors
        builder: (_) => CustomDialogBox(
          title: 'Not Internet Available',
          text: 'Retry',
          descriptions:
              '',
          img: const SizedBox.shrink(),
          onPressed: () {
            Get.back();
            forFirstTime();
          },
        ),
      );
      // Timer(const Duration(seconds: ConstantSettings.splashScreenTime),
      //     () => checkState())
    }


  }
}
