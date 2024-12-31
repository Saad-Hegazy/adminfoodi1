import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersOnTheWayData {
  Crud crud;
  OrdersOnTheWayData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.OntheWayOrders, {});
    return response.fold((l) => l, (r) => r);
  }



}