import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/Items_data.dart';
import '../../data/model/itemsmodel.dart';

class  ItemsController extends GetxController{

  ItemsData  itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest ;
  getData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await itemsData.get();
    print("=============== ItemsController $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        List datalist = response['data'];
        data.addAll(datalist.map((e)=> ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  deleteItem(String id, String imagename){
    itemsData.delete({"id": id, "imagename": imagename,});
    data.removeWhere((element)=> element.itemsId == id);
    refreshData();
    update();
  }
  refreshData(){
  getData();
  }
  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsedit,arguments: {
      'itemsModel':itemsModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
