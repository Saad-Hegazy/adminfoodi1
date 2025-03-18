import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String ordersid) async {
    var response = await crud.postData(AppLink.detailsOrders, {"ordersid": ordersid });
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