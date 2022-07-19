import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:technoapp_qr/constants/controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultController extends GetxController {
  static ResultController instance = Get.find();

  RxString resultText = 'NO RESULT!'.obs;
  RxBool isCameraSource = true.obs;
  Rx<BarcodeType> barcodeType = BarcodeType.text.obs;
  
  void setResult(var result, var type, bool fromCam) {

    resultText.value = result;
    isCameraSource.value = fromCam;
    savetoLocal(resultText.value);

    //  barcodeType.value = type;
  }

  void navigatetoLink() async {
    FirebaseAnalytics.instance.logEvent(name: "link_navigated",
    parameters: {
      "link":"gen_navigated",
    }
    );
    final Uri _url = Uri.parse(resultText.value);
    if (!await launchUrl(_url)
    ) throw 'Could not launch $_url';
  }

  void savetoLocal(String qrValue) {
    historyController.setToRecord(qrValue, isCameraSource.value);
  }
}
