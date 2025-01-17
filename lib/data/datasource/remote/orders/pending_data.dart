import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
  approveOrder(String ordersid,String userid, String pricedelivery, String totalprice ) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "ordersid": ordersid,
      "usersid":userid,
      "pricedelivery":pricedelivery,
      "orderstotalprice" :totalprice,
    });
    return response.fold((l) => l, (r) => r);
  }
  delete(String orderid,String userid) async{
    var response = await crud.postData(AppLink.cancelorder,
        {"orderid": orderid,
        "userid":userid
        });
    return  response.fold((l)=>l,(r)=>r);
  }
}