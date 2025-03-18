import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/orderscenceledbyuserView_controller.dart';
import '../../../controller/orders/orderscompletedView_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/CardOrdersListCanceledByUser.dart';
import '../../widget/orders/orderslistcard.dart';
import '../../widget/orders/orderslistcardontheway.dart';
import '../../widget/orders/orderslistcompleted.dart';
class OrdersCanceledByUserView extends StatelessWidget {
  const OrdersCanceledByUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersCanceledByUserController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersCanceledByUserController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersListCanceledByUser(listdata: controller.data[index])),
              )))),
        ));
  }
}