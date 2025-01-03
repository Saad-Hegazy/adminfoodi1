import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/users/deliveryview.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.adddelivery);
      },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<DeliveryControllerImp>(
          builder: ((controller)=>HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Row(
                          children:[
                            Expanded(
                                flex:3,
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            Get.defaultDialog(
                                                title: "warning",
                                                middleText: "are you sure from deleting this delivery",
                                                onCancel: (){},
                                                onWillPop:null,
                                                onConfirm:(){
                                                  controller.deleteDelivery(
                                                    controller.data[index]["delivery_id"].toString(),
                                                  );
                                                  Get.back();
                                                }
                                            );
                                          }, icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                  subtitle:Text(controller.data[index]["delivery_phone"]),
                                  title: Text(controller.data[index]["delivery_name"]),
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
