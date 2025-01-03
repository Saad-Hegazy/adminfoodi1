import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/users_data.dart';
import 'deliveryview.dart';

abstract class AddDeliveryController extends GetxController {
  addDelivery();
}
class AddDeliveryControllerImp extends AddDeliveryController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController deliveryname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest= StatusRequest.none;

  UsersData usersData = UsersData(Get.find());

  List data = [];

  addDelivery() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await usersData.addDelivery(
          deliveryname.text, password.text, email.text, phone.text);
      print("=============================== addDelivery $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.deliveryView);
          DeliveryControllerImp c =Get.find();
          c.getDeliveryData();
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }


  @override
  void onInit() {
    deliveryname = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    deliveryname.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}