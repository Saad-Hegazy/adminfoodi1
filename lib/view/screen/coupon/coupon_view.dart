import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/coupon/couponview_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CouponViewController());
    return  Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text("Coupons"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.couponsAdd);
      },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<CouponViewController>(
          builder: ((controller)=>HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Row(
                          children: [Expanded(
                              flex:1,
                              child:
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(controller.data[index]["coupon_name"] +"\n" + controller.data[index]["coupon_discount"].toString() + "% " ),
                              )),
                            Expanded(
                                flex:4,
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            Get.defaultDialog(
                                                title: "warning",
                                                middleText: "are you sure from deleting this product",
                                                onCancel: (){},
                                                onWillPop:null,
                                                onConfirm:(){
                                                  controller.deletecoupon(
                                                      controller.data[index]["coupon_id"].toString(),
                                                  );
                                                  Get.back();
                                                }
                                            );
                                          }, icon: Icon(Icons.delete)),
                                      // IconButton(
                                      //     onPressed: (){
                                      //       controller.goToPageEdit(controller.data[index]);},
                                      //     icon: Icon(Icons.edit)),
                                    ],
                                  ),
                                  subtitle:Text("expiredate: "+controller.data[index]["coupon_expiredate"]),
                                  title: Text("count: "+controller.data[index]["coupon_count"].toString()),
                                )
                            )
                          ],

                        ),
                      );

                    }
                )),

          )
          )
      ),

    );
  }
}
