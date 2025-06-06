import 'package:adminfoodi1/core/constant/imgaeasset.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widget/home/cardadmin.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
        title:Text("Home"),
      ),
      body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 150),
                    physics:NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CardAdminHome(
                        url: AppImageAsset.Categories,
                        title: 'Categories',
                        onClick: () {
                          Get.toNamed(AppRoute.categoriesview);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.product,
                        title: 'Product',
                        onClick: () {
                          Get.toNamed(AppRoute.itemsview);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.delivery,
                        title: 'Delivery',
                        onClick: () {
                          Get.toNamed(AppRoute.deliveryView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.avatar,
                        title: 'Admin',
                        onClick: () {
                          Get.toNamed(AppRoute.adminView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.order,
                        title: 'Orders',
                        onClick: () {
                          Get.toNamed(AppRoute.ordersScreen);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.imageslider,
                        title: 'Image Slider',
                        onClick: () {
                          Get.toNamed(AppRoute.imagesliderview);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.couponimage,
                        title: 'Coupons',
                        onClick: () {
                          Get.toNamed(AppRoute.couponsView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.Notifications,
                        title: 'Send Notifications',
                        onClick: () {
                          Get.toNamed(AppRoute.notifications);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.orderscompleted,
                        title: 'Orders Completeds',
                        onClick: () {
                          Get.toNamed(AppRoute.orderscompletedView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.canceledorder,
                        title: 'Orders Canceled By User',
                        onClick: () {
                          Get.toNamed(AppRoute.ordersCanceledByUserView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.rejectedorder,
                        title: 'Rejected Orders',
                        onClick: () {
                          Get.toNamed(AppRoute.ordersCanceledByAdminView);
                        },
                      ),
                      CardAdminHome(
                        url: AppImageAsset.settingsImage,
                        title: 'Settings',
                        onClick: () {
                          Get.toNamed(AppRoute.settings);
                        },),
                    ],)],
              ))
    );
  }
}