import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/notification_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../../core/shared/custombutton.dart';
import '../../core/shared/customtextformglobal.dart';
import '../widget/notifications/chooserecipient.dart';
class SendNotifications extends StatelessWidget {
  const SendNotifications({super.key});
  @override
  Widget build(BuildContext context) {
    NotificationController controlle =Get.put(NotificationController()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Notification"),
      ),
      body: GetBuilder<NotificationController>(builder: (controller)=> HandlingDataView(
          statusRequest: controller.statusRequest!, widget: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formState ,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                  hinttext: "Add title",
                  labeltext: "title",
                  iconData: Icons.title,
                  mycontroller: controlle.title,
                  valid: (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              CustomTextFormGlobal(
                  hinttext:  "message",
                  labeltext: "message",
                  iconData: Icons.message,
                  mycontroller:  controlle.message,
                  valid:  (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              chooseRecipient(notificationController: controller,),
              CustomButton(text: "Send",
                onPressed: (){
                  controlle.sendNotification();
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}