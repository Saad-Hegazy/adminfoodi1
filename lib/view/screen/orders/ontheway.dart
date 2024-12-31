import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/ontheway_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/orders/orderslistcardontheway.dart';

class OrderswithdeliveryView extends StatelessWidget {
  const OrderswithdeliveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnTheWayOrdersController());
    return Scaffold(
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OnTheWayOrdersController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersListOnTheWay(listdata: controller.data[index])),
              )))),
        ));
  }
}