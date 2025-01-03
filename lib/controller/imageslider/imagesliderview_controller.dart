import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/imageslider_data.dart';

class  ImageSliderController extends GetxController{

  ImageSliderData  imageSliderData = ImageSliderData(Get.find());

  List data = [];

  late StatusRequest statusRequest ;
  getData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await imageSliderData.get();
    print("=============== ImageSliderController $response");
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
  deleteImageSlider(String id, String imagename){
    imageSliderData.delete({"id": id, "ImageSlidername": imagename,});
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
