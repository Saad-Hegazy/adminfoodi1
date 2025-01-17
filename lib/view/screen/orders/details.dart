import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/orders/details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColor.primaryColor,
        title: const Text('Orders Details',style: TextStyle(
            color:Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                  controller.data.length,
                                      (index) => TableRow(children: [
                                    Text("${controller.data[index].itemsName}",
                                        textAlign: TextAlign.center),
                                    Text("${controller.data[index].countitems} ${ controller.data[index].cartitemisbox.toString()==1? "Box":"Unit"} ", textAlign: TextAlign.center),
                                    Text("${controller.data[index].cartitemisbox.toString()==1?controller.data[index].cartitemprice!.toInt() * controller.data[index].itemsquantityinbox!.toInt() : controller.data[index].cartitemprice!.toStringAsFixed(2)}",
                                        textAlign: TextAlign.center),
                                  ]))
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:   Text("Total Price : ${controller.ordersModel.ordersTotalprice?.toStringAsFixed(2)}\S\A\R",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text("Customer Name: ${controller.customername}"),
                          ListTile(
                            onTap: () async{
                              await  launchUrl(Uri.parse("tel:+966${controller.customerphone}"));
                            },
                            trailing: Icon(Icons.phone_callback_outlined),
                            title: Text("Customer Phone"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel.ordersType == 0)    Card(
                    child: Container(
                        child: ListTile(
                          title: const Text("Shipping Address",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                        )),
                  ),
                  if (controller.ordersModel.ordersType == 0)    Card(
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                    ),
                  )
                ])))),
      ),
    );
  }
}