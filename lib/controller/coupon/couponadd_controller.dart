import 'dart:io';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/coupon_data.dart';
import '../../data/datasource/remote/imageslider_data.dart';
import 'couponview_controller.dart';

class  AddCouponController extends GetxController{

  CouponData  couponData = CouponData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none ;
  late TextEditingController couponname;
  late TextEditingController couponcount;
  late TextEditingController coupondiscount;
   String? couponexpiredate;

  addData()async{
    if(formState.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      Map data ={
        "couponname":couponname.text,
        "couponcount":couponcount.text,
        "coupondiscount":coupondiscount.text,
        "couponexpiredate":couponexpiredate,
        "coupondatetime":DateTime.now().toString(),
      };
      var response = await couponData.add(data);
      print("=============== addDataImageSliderController $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.couponsView);
          CouponViewController c =Get.find();
          c.getData();
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();}

  }
  @override
  void onInit() {
    couponname =TextEditingController();
    couponcount =TextEditingController();
    coupondiscount =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    couponname.dispose();
    couponcount.dispose();
    coupondiscount.dispose();
    super.dispose();
  }
}
