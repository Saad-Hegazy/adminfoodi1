import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/coupon/couponadd_controller.dart';
import 'pickDate.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextformglobal.dart';

class CouponAdd extends StatelessWidget {
   CouponAdd({super.key});
  AddCouponController controlle =Get.put(AddCouponController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Coupon"),
      ),
      body: GetBuilder<AddCouponController>(builder: (controller)=> HandlingDataView(

          statusRequest: controller.statusRequest!, widget: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formState ,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                  hinttext: "Add Coupon Name",
                  labeltext: "Coupon name",
                  iconData: Icons.category,
                  mycontroller: controller.couponname,
                  valid: (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              CustomTextFormGlobal(
                  hinttext: "Add coupon count",
                  labeltext: "Count",
                  iconData: Icons.category,
                  mycontroller: controller.couponcount,
                  valid: (val){
                    return validInput(val!, 1, 100, "");
                  },
                  isNumber: true),
              CustomTextFormGlobal(
                  hinttext:  "Discount",
                  labeltext: "Discount",
                  iconData: Icons.category,
                  mycontroller:  controller.coupondiscount,
                  valid:  (val){
                    return validInput(val!, 1, 100, "");
                  },
                  isNumber: true),
              ExpirationDatePicker(),
              CustomButton(text: "Add",
                onPressed: (){
                  controller.addData();
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}
