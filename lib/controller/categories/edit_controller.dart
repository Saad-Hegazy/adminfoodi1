import 'dart:io';
import 'package:adminfoodi1/controller/categories/view_controller.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:adminfoodi1/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/categories_data.dart';

class  CategorieEditController extends GetxController{

  CategoriesData  categorieData = CategoriesData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none ;
  late TextEditingController name;
  late TextEditingController namear;
  CategoriesModel?  categoriesModel;
  File? file;
  chooseImage()async{
    file = await fileUploadGallery(false);
    update();
  }

  editData()async{
    if(formState.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      Map data ={
        "id":categoriesModel!.categoriesId.toString(),
        "name":name.text,
        "namear":namear.text,
        "imageold":categoriesModel!.categoriesImage!,
        "datetime":DateTime.now().toString(),

      };
      var response = await categorieData.edit(data,file);
      print("=============== editDataCategorieController $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.categoriesview);
          CategorieController c =Get.find();
          c.getData();
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

  }
  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    name =TextEditingController();
    namear =TextEditingController();
    name.text= categoriesModel!.categoriesName!;
    namear.text= categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
