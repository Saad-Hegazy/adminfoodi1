import 'package:get/get.dart';
import '../../../controller/orders/accepted_controller.dart';
import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';
class CardOrdersListAccepted extends GetView<OrdersAcceptedController> {
  final OrdersModel listdata;
  const CardOrdersListAccepted({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    listdata.ordersDatetime!,
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(),
              Text("Order Price : ${listdata.ordersPrice?.toStringAsFixed(2)} \S\A\R"),
              Text("Delivery Price : ${listdata.ordersPricedelivery?.toStringAsFixed(2)} \S\A\R "),
              Text("Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
              const Divider(),
              Text("Total Price : ${listdata.ordersTotalprice!.toStringAsFixed(2)} \S\A\R ",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  SizedBox(width: 3),
                  if (listdata.ordersStatus! == 1) MaterialButton(
                    onPressed: () {
                      controller.startDeliveres(
                          listdata.ordersId.toString(),
                          listdata.ordersUsersid.toString(),
                          listdata.ordersType.toString(),
                      );
                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Start Delivered"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}