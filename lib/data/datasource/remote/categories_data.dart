import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';
class CategoriesData{
  Crud crud;
  CategoriesData(this.crud);
  get() async{
    var response = await crud.postData(AppLink.cegoriesview,{});
    return  response.fold((l)=>l,(r)=>r);
  }
  add(Map data,File file) async{
    var response = await crud.addRequestWithImageOne(AppLink.cegoriesadd,data,file);
    return  response.fold((l)=>l,(r)=>r);
  }
  delete(Map data) async{
    var response = await crud.postData(AppLink.cegoriesdelete,data);
    return  response.fold((l)=>l,(r)=>r);
  }
  edit(Map data, [File? file]) async{
    var response;
    if(file==null) {
       response =await crud.postData(AppLink.cegoriesedit,data);
    }else{
      response =await crud.addRequestWithImageOne(AppLink.cegoriesedit,data,file);
    }
    return  response.fold((l)=>l,(r)=>r);
  }

}