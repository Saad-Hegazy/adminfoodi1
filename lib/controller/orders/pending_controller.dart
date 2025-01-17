import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';


class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  int? adddeliveryprice ;
  MyServices myServices = Get.find();
  late TextEditingController pricedelivery;
  bool removebutton =false;

  String printOrderType(int val) {
    if (val == 0) {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(int val) {
    if (val == 0) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(int val) {
    if (val == 0) {
      return "Pending Approval";
    } else if (val == 1) {
      return "The Order is being Prepared ";
    } else if (val == 2) {
      return "Ready To Picked up by Delivery man";
    }  else if (val == 3) {
      return "On The Way";
    } else {
      return "Archive";
    }
  }
  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
    print("=============================== OrdersPendingController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  refrehOrder() {
    pricedelivery.clear();
    getOrders();
  }

  approveOrders(String ordersid,String userid,String pricedelivery , String totalprice) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveOrder(
      ordersid,
      userid,
      pricedelivery,
      totalprice
    );
    print("=============================== OrdersPendingApproveController $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        removebutton=false;
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  cancelorder(String orderid,String userid){
    ordersPendingData.delete(orderid , userid);
    data.removeWhere((element)=> element.ordersId == orderid);
    refrehOrder();
    update();
  }
  addpricedelivery(int? ordersid){
    adddeliveryprice=ordersid;
    removebutton=true;
    update();
  }

  @override
  void onInit() {
    getOrders();
    pricedelivery =TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    pricedelivery.dispose();
    super.dispose();
  }
}