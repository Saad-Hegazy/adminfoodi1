import 'package:adminfoodi1/core/class/handlingdataview.dart';
import 'package:adminfoodi1/core/functions/validinput.dart';
import 'package:adminfoodi1/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/users/addadmin_controller.dart';
import '../../../core/shared/custombutton.dart';
class AddAdmin extends StatelessWidget {
  const AddAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdminControllerImp controlle =Get.put(AddAdminControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Admin"),
      ),
      body: GetBuilder<AddAdminControllerImp>(builder: (controller)=> HandlingDataView(
          statusRequest: controller.statusRequest!, widget: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formstate ,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                  hinttext: "Add Admin Name",
                  labeltext: "Admin name",
                  iconData: Icons.category,
                  mycontroller: controlle.adminname,
                  valid: (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),

              CustomTextFormGlobal(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "13".tr,
                iconData: Icons.remove_red_eye_outlined,
                labeltext: "19".tr,
                // mycontroller: ,
              ),
              CustomTextFormGlobal(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "email");
                },
                mycontroller: controller.email,
                hinttext: "12".tr,
                iconData: Icons.email_outlined,
                labeltext: "18".tr,
                // mycontroller: ,
              ),
              CustomTextFormGlobal(
                isNumber: true,
                valid: (val) {
                  return validInput(val!, 9, 10, "phone");
                },
                mycontroller: controller.phone,
                hinttext: "22".tr,
                iconData: Icons.phone_android_outlined,
                labeltext: "21".tr,
                // mycontroller: ,
              ),
              CustomButton(text: "Add",
                onPressed: (){
                  controlle.addAdmin();
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}
