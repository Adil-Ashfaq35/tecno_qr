


import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BehaviourController extends GetxController {
  static BehaviourController instance = Get.find();
  RxBool isClicked=false.obs;
  RxBool IsLtr=true.obs;


  Future<void> disableButton() async {
    isClicked.value=true;
   Future.delayed(const Duration(seconds: 4),(){
     isClicked.value=false;
   });
  }

  // Future<bool> onWillPop() async {
  //
  //   return (await
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Are you sure?'),
  //       content: const Text('Do you want to exit this App'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
  //           child: const Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             exit(0);
  //           }, // <-- SEE HERE
  //           child: const Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   )) ??
  //       false;
  // }

}