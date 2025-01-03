import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/users_data.dart';
import 'adminview_controller.dart';

abstract class AddAdminController extends GetxController {
  addAdmin();
}
class AddAdminControllerImp extends AddAdminController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController adminname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest= StatusRequest.none;

  UsersData usersData = UsersData(Get.find());

  List data = [];


  addAdmin() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await usersData.addAdmin(
          adminname.text, password.text, email.text, phone.text);
      print("=============================== addAdmin $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.adminView);
          AdminControllerImp c =Get.find();
          c.getAdminData();
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  refreshData(){
    addAdmin();
  }

  @override
  void onInit() {
    adminname = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    adminname.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}