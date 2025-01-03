import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/users_data.dart';

abstract class AdminController extends GetxController {
  getAdminData();
}
class AdminControllerImp extends AdminController {


  StatusRequest statusRequest= StatusRequest.none;

  UsersData usersData = UsersData(Get.find());

  List data = [];


  getAdminData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await usersData.getadmin();
    print("=============== getAdminData $response");
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
  deleteAdmin(String adminid){
    usersData.deleteAdmin(adminid);
    refreshData();
    update();
  }
  refreshData(){
    getAdminData();
  }
  @override
  void onInit() {
    getAdminData();
    super.onInit();
  }
}