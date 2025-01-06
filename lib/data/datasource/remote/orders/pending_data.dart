import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
  approveOrder(String ordersid,String userid, String pricedelivery) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "ordersid": ordersid,
      "usersid":userid,
      "pricedelivery":pricedelivery,
    });
    return response.fold((l) => l, (r) => r);
  }
}