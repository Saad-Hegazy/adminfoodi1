import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  sendNotification(String title,String message,String topic) async {
    var response = await crud.postData(AppLink.notification, {
      "title": title,
      "message": message,
      "topic": topic,
    });
    return response.fold((l) => l, (r) => r);
  }
}