import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';
class UsersData{
  Crud crud;
  UsersData(this.crud);
  getadmin() async{
    var response = await crud.postData(AppLink.viewadmin,{});
    return  response.fold((l)=>l,(r)=>r);
  }
  getdelivery() async{
    var response = await crud.postData(AppLink.viewdelivery,{});
    return  response.fold((l)=>l,(r)=>r);
  }
  deleteDelivery(String deliveryid) async{
    var response = await crud.postData(AppLink.deleteDelivery, {
      "deliveryid":deliveryid
    });
    return  response.fold((l)=>l,(r)=>r);
  }
  deleteAdmin(String adminid) async{
    var response = await crud.postData(AppLink.deleteadmin, {
      "adminid":adminid
    });
    return  response.fold((l)=>l,(r)=>r);
  }
  addAdmin(String adminName,String password,String email,String phone) async{
    var response = await crud.postData(AppLink.addAdmin,{
      "adminname": adminName,
      "password":password ,
      "email":email ,
      "phone":phone ,
    });
    return  response.fold((l)=>l,(r)=>r);
  }
  addDelivery(String deliveryName,String password,String email,String phone) async{
    var response = await crud.postData(AppLink.addDelivery, {
      "deliveryname": deliveryName,
      "password":password ,
      "email":email ,
      "phone":phone     });
    return  response.fold((l)=>l,(r)=>r);
  }
}