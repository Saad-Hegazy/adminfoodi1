import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/orders/notification_data.dart';
import 'home_controller.dart';
class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  late TextEditingController title;
  late TextEditingController message;
  StatusRequest? statusRequest = StatusRequest.none ;
  String? recipient ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  void setTopic(String topic) {
    recipient = topic;
    update();
  }
  sendNotification() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.sendNotification(
       title.text,
      message.text,
      recipient!,
    );
    print("=============================== NotificationController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Success",
            messageText:  Text("The notification was sent successfully"));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    title =TextEditingController();
    message =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    title.dispose();
    message.dispose();
    super.dispose();
  }
}