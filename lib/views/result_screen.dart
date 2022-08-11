


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:technoapp_qr/core/router/router_generator.dart';
import 'package:technoapp_qr/models/language/lnaguage_constant.dart';
import 'package:technoapp_qr/views/widgets/appbar_design.dart';
import 'package:technoapp_qr/views/widgets/dialogs/alertDialog.dart';
import 'package:technoapp_qr/views/widgets/options_widget.dart';
import '../constants/utils/apptheme.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
   // permission();
    super.initState();
  }
  permission() async {
    PermissionStatus;
    PermissionStatus allow=  await Permission.storage.request();
    if(allow.isGranted){
      if (kDebugMode) {
        print("permission granted");
      }
      else{
        print("permission denied");
      }
    }
    else if (allow.isPermanentlyDenied){
      if (kDebugMode) {
        print("persmission denied");
      }
      await showDialog(context: context, builder: (context){
        return DialogWidget(
          title: translation(context).local_Permission_Alert,
          description: translation(context).local_Alert_Description,
          cancelTap: (){
            Get.back();
          },
          continueTap: () async {
            Get.back();
              await openAppSettings();
            navigationController.getOffAll(RouteGenerator.customDrawer);

          },
        );
      });
    }
    else if(allow.isDenied){
      await showDialog(context: context, builder: (context){
        return DialogWidget(
          title:  translation(context).local_Permission_Alert,
          description: translation(context).local_Alert_Description,
          cancelTap: (){
            Get.back();
          },
          continueTap: () async {
            Get.back();
            await openAppSettings();

          },
        );
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () {

        navigationController.getOffAll(RouteGenerator.customDrawer);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBarWidget(
            title: translation(context).result_Screen,
            iconButton: IconButton(
                onPressed: () {
                  navigationController. flowFromhistory.value?
                   navigationController.goBack():
                  navigationController.getOffAll(RouteGenerator.customDrawer);
                },
                icon: const Icon(Icons.arrow_back))),
        body: Container(
          decoration: const BoxDecoration(color: AppTheme.lightBackgroundColor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${translation(context).result_Language_Label}${translation(context).text}",
                    style: const TextStyle(
                        color: Color.fromARGB(115, 33, 33, 33),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                 const Expanded(
                  flex: 1,
                  child: Resultbox(),
                ),
                Column(
                  children: [
                    OptionsWidget(
                            icon: Icons.link,
                            optionText: translation(context).navigate_Button_Text,
                            onTap:() {
                       if (behaviourController.isClicked.value ==
                                  false) {
                                behaviourController.disableButton();
                              bool _validURL =
                                  Uri.parse(resultController.resultText.value)
                                      .isAbsolute;
                              _validURL
                                  ? resultController.navigatetoLink()
                                  : resultController.isClicked.value? Get.snackbar(
                                      translation(context).invalid_Url,
                                      translation(context).result_Text_Type_Is_Not_Url_To_Navigate,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppTheme.errorColor,
                                      colorText: Colors.white,
                                    ):null;
                            }
                       else{
                          if (kDebugMode) {
                            print("tap is disabled");
                          }
                       }},

                       ),

                    OptionsWidget(
                        icon: Icons.share,
                        optionText: translation(context).share_Button_Text,
                        onTap: () {
                          Share.share(
                              'Here is the Qr Result text:${resultController.resultText.value}');
                        }),
                    OptionsWidget(
                            icon: Icons.copy,
                            optionText: translation(context).copy_Button_Text,

                              onTap: () {
                                if (behaviourController.isClicked.value == false) {
                                  behaviourController.disableButton();
                                  Clipboard.setData(ClipboardData(
                                      text: resultController.resultText.value))
                                      .then((value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                      duration:
                                      const Duration(microseconds: 1500),
                                      backgroundColor: Colors.greenAccent,
                                      content: Text(
                                          '${resultController.resultText.value}  ${translation(context).copied}'))));
                                }
                                else
                                  {
                                    print('Tap is disabled');
                                  }
                              }




                                ),

                  ],
                )
              ]),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Resultbox extends StatelessWidget {
  const Resultbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.tight( Size(350.sm, 350.sm)),
      padding: EdgeInsets.all(20.sm),
      margin: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.r)),
      child: SingleChildScrollView(
        child: Text(
          resultController.resultText.value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

}




// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Cancel"),
//     onPressed:  () {
//       Get.back();
//     },
//   );
//   Widget continueButton = TextButton(
//     child: const Text("Continue"),
//     onPressed:  () async {
//       Get.back();
//       openAppSettings();
//     },
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: const Text("Permission Alert"),
//     content: const Text("Allow access to local storage to enable this feature or you can follow the following steps to use the application without permission:\n1- Capture the QR Code image via your camera application or select a local image from your local files.\n2- Share the image to TecnoCode application.\n3- The result will be displayed directly in the TecnoCode application."),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
