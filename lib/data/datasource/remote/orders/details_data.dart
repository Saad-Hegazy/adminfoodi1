import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String ordersid, String userstype) async {
    var response = await crud.postData(AppLink.detailsOrders, {"ordersid": ordersid, "userstype" : userstype });
    return response.fold((l) => l, (r) => r);
  }
  customerData(String customerid) async {
    var response = await crud.postData(AppLink.customerdetails, {"customerid": customerid});
    return response.fold((l) => l, (r) => r);
  }
  deliveryData(String deliveryid) async {
    var response = await crud.postData(AppLink.deliverydetails, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}