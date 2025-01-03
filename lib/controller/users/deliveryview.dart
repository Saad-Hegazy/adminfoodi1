import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/users_data.dart';

abstract class DeliveryController extends GetxController {
  getDeliveryData();
}
class DeliveryControllerImp extends DeliveryController {


  StatusRequest statusRequest= StatusRequest.none;

  UsersData usersData = UsersData(Get.find());

  List data = [];


  getDeliveryData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await usersData.getdelivery();
    print("=============== getDeliveryData $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        data = response['data'];
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  deleteDelivery(String deliveryid){
    usersData.deleteDelivery(deliveryid);
    refreshData();
    update();
  }
  refreshData(){
    getDeliveryData();
  }
  @override
  void onInit() {
    getDeliveryData();
    super.onInit();
  }
}