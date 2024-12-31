import 'dart:io';
import 'package:adminfoodi1/controller/items/view_controller.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/Items_data.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';

class  ItemEditController extends GetxController{
  ItemsData  itemData = ItemsData(Get.find());
  List <SelectedListItem> dropdownlist=[];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none ;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController desc_ar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController priceForMerchant;
  late TextEditingController priceForMosque;
  late TextEditingController discount;
  late TextEditingController discountForMerchant;
  late TextEditingController discountForMosque;
  late TextEditingController  catname;
  late TextEditingController  catid;
  File? file;
  ItemsModel?  itemsModel;
  String? active  ;
  showOptionImage(){
    showbottommenu(chooseImageCamera,chooseImageGallery);

  }
  chooseImageCamera()async{
    file = await imageUploadCamera();
    update();
  }
  chooseImageGallery()async{
    file = await fileUploadGallery(false);
    update();
  }

  editData()async{
    if(formState.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
      Map data ={
        "id":itemsModel!.itemsId.toString(),
        "name":name.text,
        "namear":namear.text,
        "active": active,
        "desc":desc.text,
        "descar":desc_ar.text,
        "count":count.text,
        "price":price.text,
        "pricemerchant":priceForMerchant.text,
        "pricemosque":priceForMosque.text,
        "discount":discount.text,
        "discountmerchant":discountForMerchant.text,
        "discountmosque":discountForMosque.text,
        "catid":catid.text,
        "imageold":itemsModel!.itemsImage,
        "datenow":DateTime.now().toString(),
      };
      var response = await itemData.edit(data,file);
      print("=============== ItemEditController $response");
      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.itemsview);
          ItemsController c =Get.find();
          c.getData();
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

  }
  changeStatusActive(val){
    active = val;
    update();
  }

  getCategories()async{
    CategoriesData  categorieData = CategoriesData(Get.find());
    statusRequest=StatusRequest.loading;
    var response = await categorieData.get();
    print("=============== CategorieController $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        List<CategoriesModel> data =[];
        List datalist = response['data'];
        data.addAll(datalist.map((e)=> CategoriesModel.fromJson(e)));
        for(int i =0 ;i< data.length; i++){
          dropdownlist.add(SelectedListItem(name: data[i].categoriesName!, value:data[i].categoriesId.toString() ) );
        }
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  showDropdown(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name:"a"),SelectedListItem(name:"b")],
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;

        },
      ),
    ).showModal(context);
  }


  @override
  void onInit() {
    getCategories();
    itemsModel = Get.arguments['itemsModel'];
    name =TextEditingController();
    namear =TextEditingController();
    desc =TextEditingController();
    desc_ar =TextEditingController();
    count =TextEditingController();
    price =TextEditingController();
    priceForMerchant =TextEditingController();
    priceForMosque =TextEditingController();
    discount =TextEditingController();
    discountForMerchant =TextEditingController();
    discountForMosque =TextEditingController();
    catid =TextEditingController();
    catname =TextEditingController();
    name.text= itemsModel!.itemsName!;
    namear.text= itemsModel!.itemsNameAr!;
    desc.text=itemsModel!.itemsDesc!;
    desc_ar.text=itemsModel!.itemsDescAr!;
    count.text=itemsModel!.itemsCount!.toString();
    price.text=itemsModel!.itemsPrice!.toString();
    priceForMerchant.text=itemsModel!.itemsPriceMerchant!.toString();
    priceForMosque.text=itemsModel!.itemsPriceMosque!.toString();
    discount.text=itemsModel!.itemsDescount!.toString();
    discountForMerchant.text=itemsModel!.itemsDescountMerchant!.toString();
    discountForMosque.text=itemsModel!.itemsDescountMosque!.toString();
    catid.text=itemsModel!.categoriesId!.toString();
    catname.text=itemsModel!.categoriesName!;
    dropdownname = TextEditingController();
    dropdownid =TextEditingController();
    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}
