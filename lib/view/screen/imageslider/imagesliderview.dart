import 'package:adminfoodi1/core/class/handlingdataview.dart';
import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:adminfoodi1/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/imageslider/imagesliderview_controller.dart';
import '../../../core/constant/color.dart';
class ImageSliderView extends StatelessWidget {
  const ImageSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImageSliderController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text("Image Slider"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.imageslideradd);
      },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ImageSliderController>(
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
                                flex:2,
                                child:
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: CachedNetworkImage(
                                    height: 100,
                                    imageUrl: "${AppLink.imageSlider}/${controller.data[index]["ImageSlider_name"]}" ),
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
                                                  middleText: "are you sure from deleting this Image",
                                                  onCancel: (){},
                                                  onWillPop:null,
                                                  onConfirm:(){
                                                    controller.deleteImageSlider(
                                                        controller.data[index]["ImageSlider_id"].toString(),
                                                        controller.data[index]["ImageSlider_name"]
                                                    );
                                                    Get.back();
                                                  }
                                              );
                                            }, icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                    subtitle:Text(controller.data[index]["ImageSlider_usertype"]) ,
                                    title: Text(controller.data[index]["ImageSlider_creat"]),
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
