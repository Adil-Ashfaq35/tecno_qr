import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  RxBool flowFromhistory= false.obs;
  
  Future<dynamic>? navigateToNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  Future<dynamic>? navigateToNamedWithArg(String routeName, dynamic arg) {
    return Get.toNamed(routeName, arguments: arg);
  }

  Future<dynamic>? getOffAll(String routeName) {
    return Get.offAllNamed(routeName);
  }

  Future<dynamic>? getOff(String routeName) {
    return Get.off(routeName);
  }

  goBack() => Get.back();
}
