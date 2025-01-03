import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/users/adminview_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
class AdminView extends StatelessWidget {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AdminControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.addAdmin);
      },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AdminControllerImp>(
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
                                                  middleText: "are you sure from deleting this admin",
                                                  onCancel: (){},
                                                  onWillPop:null,
                                                  onConfirm:(){
                                                    controller.deleteAdmin(
                                                        controller.data[index]["admin_id"].toString(),
                                                    );
                                                    Get.back();
                                                  }
                                              );
                                            }, icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                    subtitle:Text(controller.data[index]["admin_phone"]),
                                    title: Text(controller.data[index]["admin_name"]),
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
