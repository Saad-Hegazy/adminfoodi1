import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/accepted_controller.dart';
import '../../../controller/orders/ontheway_controller.dart';
import '../../../controller/orders/order_screen_controller.dart';
import '../../../controller/orders/pending_controller.dart';
import '../home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length , ((index) {
                  return Expanded(
                         child: CustomButtonAppBar(
                                               textbutton: controller.bottomappbar[index]['title'],
                                               icondata: controller.bottomappbar[index]['icon'],
                                               onPressed: () {
                          controller.changePage(index);
                          switch(index){
                            case 0:
                              OrdersPendingController controller = Get.find<OrdersPendingController>();
                              controller.refrehOrder();
                              break;
                            case 1:
                              OrdersAcceptedController controller =Get.find<OrdersAcceptedController>();
                              controller.refrehOrder();
                              break;
                            case 2:
                              OnTheWayOrdersController controller =Get.find<OnTheWayOrdersController>();
                              controller.refrehOrder();
                              break;
                          }
                          },
                          active: controller.currentpage == index ? true : false),
                       );
                }))
              ],
            )));
  }
}