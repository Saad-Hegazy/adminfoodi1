import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/orders/details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../core/functions/truncatetext.dart';
import '../../../linkapi.dart';

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
                                Text("Image",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
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
                                        CachedNetworkImage(
                                          imageUrl: "${AppLink.imagestItems}/${controller.data[index]["items_image"]}",
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,// Ensure image fits within the space
                                          alignment : Alignment. center,
                                          placeholder: (context, url) => CircularProgressIndicator(
                                            color: AppColor.primaryColor,
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                                        ),
                                        Text(
                                          translateDatabase(
                                            truncateProductName(controller.data[index]["items_name_ar"].toString()),
                                            truncateProductName(controller.data[index]["items_name"].toString()),
                                          ),
                                          style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 14, // Adjust font size for readability
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis, // Handle long text
                                        ),
                                        Text("${controller.data[index]["item_quantity"]} ${controller.data[index]["item_unit"]==0?"Unit":"Box"}", textAlign: TextAlign.center),
                                        Text(controller.data[index]["total_price"].toStringAsFixed(2),
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
                          controller.completercontroller
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