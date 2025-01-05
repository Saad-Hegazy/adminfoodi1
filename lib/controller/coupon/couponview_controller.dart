import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/coupon_data.dart';
import '../../data/datasource/remote/imageslider_data.dart';

class  CouponViewController extends GetxController{

  CouponData  couponData = CouponData(Get.find());

  List data = [];

  late StatusRequest statusRequest ;
  getData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await couponData.get();
    print("=============== CouponViewController $response");
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
  deletecoupon(String couponid){
    couponData.delete({"couponid": couponid});
    refreshData();
    update();
  }
  refreshData(){
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
