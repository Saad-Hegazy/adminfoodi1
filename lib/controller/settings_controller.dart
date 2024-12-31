import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../core/constant/routes.dart';
import '../core/services/services.dart';
class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool? value ;
  logout() {
    String adminid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("admin");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$adminid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login) ;
  }

  @override
  void onInit() {
    value=true;
    // TODO: implement onInit
    super.onInit();
  }
}