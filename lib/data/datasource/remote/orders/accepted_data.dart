import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viweacceptedOrders, {"id": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  startDlivered(String ordersid, String usersid,String ordertype) async {
    var response = await crud.postData(AppLink.startDliveredOrders, {
      "ordersid": ordersid, "usersid":usersid ,"ordertype" :ordertype});
    return response.fold((l) => l, (r) => r);
  }
}