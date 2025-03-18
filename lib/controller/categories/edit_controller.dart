import 'dart:io';
import 'package:adminfoodi1/controller/categories/view_controller.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:adminfoodi1/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  Uint8List? fileBytes;
  String? fileName;
  chooseImage()async{
    var fileData = await fileUploadGallery();
    if (fileData != null) {
      if (kIsWeb) {
        // Handle web-specific logic (upload base64 or process file bytes)
        fileName = fileData["name"];
        fileBytes = fileData["bytes"];
        // You can now send the base64 or bytes to your backend or process them further
      } else {
        // Handle mobile-specific logic (upload using file path)
        file = fileData;
        // Upload the file to your backend
      }
    }
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
          CategorieController categorie =Get.find();
          categorie.getData();
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
