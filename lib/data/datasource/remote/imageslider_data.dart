import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';
class ImageSliderData{
  Crud crud;
  ImageSliderData(this.crud);
  get() async{
    var response = await crud.postData(AppLink.imagesliderview,{});
    return  response.fold((l)=>l,(r)=>r);
  }
  add(Map data,File file) async{
    var response = await crud.addRequestWithImageOne(AppLink.imageslideradd,data,file);
    return  response.fold((l)=>l,(r)=>r);
  }
  delete(Map data) async{
    var response = await crud.postData(AppLink.imagesliderdelete,data);
    return  response.fold((l)=>l,(r)=>r);
  }


}