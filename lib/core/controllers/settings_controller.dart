import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:technoapp_qr/models/settings_model.dart' as st;

class SettingController extends GetxController {
  static SettingController instance = Get.find();
  st.Settings ? settingsData;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // ignore: prefer_typing_uninitialized_variables

  @override
  // ignore: must_call_super
  void onInit() {
    getSettings();
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
}
