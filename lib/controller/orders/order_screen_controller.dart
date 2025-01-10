import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/home.dart';
import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/ontheway.dart';
import '../../view/screen/orders/orderscompletedView.dart';
import '../../view/screen/orders/pending.dart';


abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    OrdersPending(),
    OrdersAccepted(),
    OrderswithdeliveryView(),
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.present_to_all},
    {"title": "Accepted", "icon": Icons.done},
    {"title": "On the way", "icon": Icons.delivery_dining_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}