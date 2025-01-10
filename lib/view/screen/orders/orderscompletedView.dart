import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/orderscompletedView_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/orderslistcard.dart';
import '../../widget/orders/orderslistcardontheway.dart';
import '../../widget/orders/orderslistcompleted.dart';
class OrderscompletedView extends StatelessWidget {
  const OrderscompletedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrderscompletedViewController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrderscompletedViewController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersListCompleted(listdata: controller.data[index])),
              )))),
        ));
  }
}