import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:technoapp_qr/constants/utils/shared_pref.dart';
import 'package:technoapp_qr/models/settings_model.dart' as st;
import 'package:client_information/client_information.dart';

class SettingController extends GetxController {
  static SettingController instance = Get.find();
  st.Settings? settingsData;
  String? deviceid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // ignore: prefer_typing_uninitialized_variables

  @override
  // ignore: must_call_super
  void onInit() {
    getSettings();
    _getDeviceid();


  }

  Future<void> _getDeviceid() async {
    // Get client information
    ClientInformation info = await ClientInformation.fetch();
    deviceid = info.deviceId.toString();

    if (kDebugMode) {
      print(info.deviceId);
    } // EA625164-4XXX-XXXX-XXXXXXXXXXXX
    if (kDebugMode) {
      print(info.osName);
    } // iOS
  }

  Future<void> getSettings() async {
    final ref =
        firestore.collection("settings").doc("adminsettings").withConverter(
              fromFirestore: st.Settings.fromFirestore,
              toFirestore: (st.Settings settings, _) => settings.toFirestore(),
            );
    final docSnap = await ref.get();
    final settingsdata = docSnap.data(); // Convert to City object
    if (settingsdata != null) {
      settingsData = settingsdata;
    } else {
      print("No such document.");
    }
  }

  Future<void> addDocument() async {
    CollectionReference users = firestore.collection("actions");
    // Call the user's CollectionReference to add a new user
    try {
      users
          .doc(deviceid)
          .set({
            'UpdateDate': DateTime.now(),
            'GenerateActions': 0,
            'ScanActions': 0,
            'ReadActions': 0,
          })
          // ignore: avoid_print
          .then((value) => print("Actions Added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to add Actions: $error"));
    } on Exception catch (e) {
      if (kDebugMode) {
        print('here exception $e');
      }
    }
  }

  Future<void> updateHistoryitems(
      {required String generateCount,
      required String scansCount,
      required String readCount}) async {
    ClientInformation info = await ClientInformation.fetch();

    if (kDebugMode) {
      print('Device id on update last active:${info.deviceId}');
    }

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    try {
      users
          .doc(deviceid)
          .update({
            'UpdateDate': DateTime.now(),
            'GenerateActions': FieldValue.increment(1),
            'ScanActions': FieldValue.increment(1),
            'ReadActions': FieldValue.increment(1),
          })
          // ignore: avoid_print
          .then((value) => print("Actions Added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to add Actions: $error"));
    } on Exception catch (e) {
      if (kDebugMode) {
        print('here exception $e');
      }
    }
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      return false;
    }
  }

}
