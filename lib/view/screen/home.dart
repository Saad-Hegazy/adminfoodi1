import 'package:adminfoodi1/core/constant/imgaeasset.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';
import '../widget/home/cardadmin.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        appBar: AppBar(
        title:Text("Home"),
      ),
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
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
                        url: AppImageAsset.settingsImage,
                        title: 'Settings',
                        onClick: () {
                          Get.toNamed(AppRoute.settings);
                        },
                      ),
                    ],)

                ],
              )))
    );
  }
}