import 'package:adminfoodi1/controller/items/view_controller.dart';
import 'package:adminfoodi1/core/class/handlingdataview.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:adminfoodi1/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.itemsadd);
      },
      child: Icon(Icons.add),
      ),
      body: GetBuilder<ItemsController>(
        builder: ((controller)=>HandlingDataView(
          statusRequest: controller.statusRequest,
            widget:Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        controller.goToPageEdit(controller.data[index]);
                      },
                      child: Card(
                        child: Row(
                          children: [Expanded(
                        flex:2,
                        child:
                          Container(
                            padding: EdgeInsets.all(4),
                            child: CachedNetworkImage(
                              height: 80,
                                imageUrl:
                                "${AppLink.imagestItems}/${controller.data[index].itemsImage}" ),
                          )),
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
                                              middleText: "are you sure from deleting this product",
                                              onCancel: (){},
                                              onWillPop:null,
                                              onConfirm:(){
                                                controller.deleteItem(
                                                    controller.data[index].itemsId.toString(),
                                                    controller.data[index].itemsImage!
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
                                subtitle:Text(controller.data[index].categoriesName!),
                                title: Text(controller.data[index].itemsName!),
                              )
                          )
                          ],

                        ),
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
