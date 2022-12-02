// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:technoapp_qr/views/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/const_settings.dart';
import '../../../constants/utils/apptheme.dart';

class ProcessDialog extends StatelessWidget {
  String message;
  ProcessDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.amberAccent,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const SizedBox(
                height: 6,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              const SizedBox(
                height: 26,
                width: 10,
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDialog {
  static void displayPremiumDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SplashScreen();
      },
    );
  }
}

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Widget? img;
  final VoidCallback onPressed;

  const CustomDialogBox({
    Key? key,
    required this.text,
    this.img,
    required this.onPressed,
    required this.title,
    required this.descriptions,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 40;
  static const double size = 16;
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  Future<bool> onWillPop() async {

    return exit(0);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Dialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),

      ),
    );
  }

  contentBox(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 0),
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              RichText(
                  text:TextSpan(
                    text: widget.descriptions,
                    style: const TextStyle(
                   color: AppTheme.darkBackgroundColor,
                          fontSize: Constants.size,
                    ),
                    children:  [
                      TextSpan(
                        text: "Privacy policy",
                        style:  const TextStyle(
                          color: AppTheme.btnColor,
                          fontSize: Constants.size,
                          decoration: TextDecoration.underline,
                        ),
                          recognizer: TapGestureRecognizer()
                          ..onTap =(){
                            launchUrl(Uri.parse(
                                ConstantSettings.privacyUrl,
                            ));
                          }
                      ),
                    ]
                  ),


              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Center(
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    widget.text,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          fontSize: 14.sm,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              )
            ],
          ),

          // Column(
          //   mainAxisSize: MainAxisSize.max,
          //   children: <Widget>[
          //     // Text(
          //     //   widget.title,
          //     //   style:  TextStyle(
          //     //       fontSize: 20.sm,
          //     //       fontWeight: FontWeight.w600,
          //     //       color: Colors.black),
          //     // ),
          //     // const SizedBox(
          //     //   height: 15,
          //     // ),
          //     // Text(
          //     //   widget.descriptions,softWrap: true,
          //     //   style: TextStyle(fontSize: 13.sm, color: Colors.black54),
          //     //   textAlign: TextAlign.center,
          //     // ),
          //
          //     const SizedBox(
          //       height: 22,
          //     ),
          //     Align(
          //       alignment: Alignment.bottomLeft,
          //       child: FlatButton(
          //           color: AppTheme.primaryColor,
          //           onPressed: widget.onPressed,
          //           child: Text(
          //             widget.text,
          //             style: const TextStyle(fontSize: 12, color: Colors.white),
          //           )),
          //     ),
          //   ],
          // ),
        ),
        // Positioned(
        //   left: 20,
        //   right: 20,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: Constants.avatarRadius,
        //     child: ClipRRect(
        //       borderRadius: const BorderRadius.all(
        //           Radius.circular(Constants.avatarRadius)),
        //       child: widget.img,
        //     ),
        //   ),
        // ),
        //   Positioned(
        //   right: 6,
        //   bottom: 0,
        //   child: FlatButton(
        //       color: AppTheme.primaryColor,
        //       onPressed: widget.onPressed,
        //       shape: RoundedRectangleBorder(side: const BorderSide(
        //           width: 1,
        //           style: BorderStyle.solid
        //       ), borderRadius: BorderRadius.circular(50)),
        //       child: Text(
        //         widget.text,
        //         style: const TextStyle(fontSize: 15, color: Colors.white),
        //       )),
        // ),
      ],
    );
  }
}
