


import 'dart:async';

import 'package:get/get.dart';


class BehaviourController extends GetxController {
  static BehaviourController instance = Get.find();
  RxBool isClicked=false.obs;



  Future<void> disableButton() async {
    isClicked.value=true;
   Future.delayed(const Duration(seconds: 4),(){
     isClicked.value=false;
   });


  }



}