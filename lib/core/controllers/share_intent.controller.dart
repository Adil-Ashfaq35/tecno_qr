// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';
// import 'package:technoapp_qr/core/router/router_generator.dart';

// class ShareIntentController extends GetxController {
//   static ShareIntentController instance = Get.find();

//   StreamSubscription? intentDataStreamSubscription;
//   List<SharedMediaFile>? _sharedFiles;

//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   // ignore: prefer_typing_uninitialized_variables
//   String routename = RouteGenerator.mainSplashScreen;

//   final navkey = GlobalKey<NavigatorState>();
//   InitData? initData;
//   @override
//   // ignore: must_call_super
//   void onInit() {
//     getIntentwhenClosed();
//   }

//   // void getIntentwhenMemory() {
//   //   // For sharing images coming from outside the app while the app is in the memory
//   //   intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream().listen(
//   //       (List<SharedMediaFile> value) {
//   //     print('App is listening');
//   //     if (kDebugMode) {
//   //       print("Shared:${_sharedFiles?.map((f) => f.path).join(",") ?? ""}");
//   //     }
//   //     print(value + "Here is valuer");
//   //     _sharedFiles = value;
//   //     navkey.currentState!.pushNamed(RouteGenerator.enterText);
//   //   }, onError: (err) {
//   //     if (kDebugMode) {
//   //       print("getIntentDataStream error: $err");
//   //     }
//   //   });
//   // }

//   void cancelStream() {
//     intentDataStreamSubscription!.cancel();
//   }

//   Future<void> getIntentwhenClosed() async {
//     List<SharedMediaFile>? sharedValue =
//         await ReceiveSharingIntent.getInitialMedia();
//     if (sharedValue.isNotEmpty) {
//       routename = RouteGenerator.historyScreen;
//       _sharedFiles = sharedValue;
//       initData = InitData(_sharedFiles, routename);
//     } else {
//       initData = InitData(_sharedFiles, routename);
//     }
//   }
// }

// class InitData {
//   List<SharedMediaFile>? sharedFiles;
//   final String routeName;

//   InitData(this.sharedFiles, this.routeName);
// }
