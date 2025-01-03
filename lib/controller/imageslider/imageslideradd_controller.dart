import 'dart:io';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/imageslider_data.dart';
import 'imagesliderview_controller.dart';

class  AddImageSliderController extends GetxController{

  ImageSliderData  imageSliderData = ImageSliderData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none ;
  late TextEditingController imageslidername;
  String? imageSliderusertype ;

  File? file;
  chooseImage()async{
    file = await fileUploadGallery();
    update();
  }
  void setUserType(String type) {
    imageSliderusertype = type;
    update();
  }
  addData()async{
    if(formState.currentState!.validate()){
      if(file ==null) Get.snackbar("Warning", "Please Choose Image");
      statusRequest=StatusRequest.loading;
      update();
      Map data ={
        "ImageSlidername":imageslidername.text,
        "ImageSliderusertype":imageSliderusertype,
        "datetime":DateTime.now().toString(),
      };
      var response = await imageSliderData.add(data,file!);
      print("=============== addDataImageSliderController $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.imagesliderview);
          ImageSliderController c =Get.find();
          c.getData();
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();}

  }
  @override
  void onInit() {
    imageslidername =TextEditingController();
    super.onInit();
  }
}
