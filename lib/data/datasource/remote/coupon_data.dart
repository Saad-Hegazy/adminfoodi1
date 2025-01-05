import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';
class CouponData{
  Crud crud;
  CouponData(this.crud);
  get() async{
    var response = await crud.postData(AppLink.couponView,{});
    return  response.fold((l)=>l,(r)=>r);
  }
  add(Map data) async{
    var response = await crud.postData(AppLink.couponAdd,data);
    return  response.fold((l)=>l,(r)=>r);
  }
  delete(Map data) async{
    var response = await crud.postData(AppLink.couponDelete,data);
    return  response.fold((l)=>l,(r)=>r);
  }
}