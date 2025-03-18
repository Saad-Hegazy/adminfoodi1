import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrderscompletedViewData {
  Crud crud;
  OrderscompletedViewData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.ordersdone, {});
    return response.fold((l) => l, (r) => r);
  }
  getOrdersCanceledByUser() async {
    var response = await crud.postData(AppLink.viewcanceledorderbyuser, {});
    return response.fold((l) => l, (r) => r);
  }
  getOrdersCanceledByAdmin() async {
    var response = await crud.postData(AppLink.viewcanceledorderbyadmin, {});
    return response.fold((l) => l, (r) => r);
  }
}