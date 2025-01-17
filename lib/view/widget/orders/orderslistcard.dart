import 'package:get/get.dart';
import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/shared/customtextformglobal.dart';
import '../../../data/model/ordersmodel.dart';
class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrdersPendingController controlle =Get.put(OrdersPendingController()) ;

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
              Text("Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}"),
              const Divider(),
              Text("Total Price : ${listdata.ordersTotalprice!.toStringAsFixed(2)} \S\A\R ",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
              if(listdata.ordersType==0 && controlle.removebutton==false)MaterialButton(
                onPressed: () {
                  controlle.addpricedelivery(listdata.ordersId);
                },
                color: AppColor.primaryColor,
                textColor: AppColor.secondColor,

                child: const Text("Add shipping cost"),
              ),
              SizedBox(height: 10,),
              if(listdata.ordersType==0 && controlle.adddeliveryprice==listdata.ordersId)
                CustomTextFormGlobal(
                    hinttext:  "Delivery Price",
                    labeltext: "Delivery Price",
                    iconData: Icons.delivery_dining_outlined,
                    mycontroller:  controlle.pricedelivery,
                    valid:  (val){
                      return validInput(val!, 1, 100, "");
                    },
                    isNumber: true),
              Row(
                children: [
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: "warning",
                          middleText: "are you sure from canceling this order",
                          onCancel: (){},
                          onWillPop:null,
                          onConfirm:(){
                            controlle.cancelorder(listdata.ordersId.toString(), listdata.ordersUsersid.toString());
                            Get.back();
                          }
                      );
                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Cancel"),
                  ),
                  SizedBox(width: 3),
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
                   if(listdata.ordersType==1 || controlle.adddeliveryprice==listdata.ordersId)MaterialButton(
                    onPressed: () {
                       controller.approveOrders(
                         listdata.ordersId.toString(),
                         listdata.ordersUsersid.toString(),
                           listdata.ordersType==1?"0":  controlle.pricedelivery.text,
                         listdata.ordersTotalprice.toString()
                       );
                    },
                    color: AppColor.primaryColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Approve"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}