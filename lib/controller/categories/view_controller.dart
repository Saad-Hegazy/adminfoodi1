import 'package:adminfoodi1/core/constant/routes.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/categories_data.dart';
import '../../data/model/categoriesmodel.dart';
class  CategorieController extends GetxController{
  CategoriesData  categorieData = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest ;

  getData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    var response = await categorieData.get();
    print("=============== CategorieController $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success"){
        List datalist = response['data'];
        data.addAll(datalist.map((e)=> CategoriesModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename){
    categorieData.delete({"id": id, "imagename": imagename,});
    data.removeWhere((element)=> element.categoriesId == id);
    refreshData();
    update();
  }

  refreshData(){
    getData();
  }

  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesedit,arguments: {
      'categoriesModel':categoriesModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
