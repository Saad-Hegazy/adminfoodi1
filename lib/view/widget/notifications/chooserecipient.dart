import 'package:flutter/material.dart';
import '../../../controller/notification_controller.dart';
class chooseRecipient extends StatelessWidget {
  const chooseRecipient({
    super.key,
    required this.notificationController,
  });
  final NotificationController notificationController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "choose recipient ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          title: const Text("Normal User"),
          value: "users",
          groupValue: notificationController.recipient,
          onChanged: ( value) {
            if (value != null) {
              notificationController.setTopic(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("Mosque"),
          value: "Mosque",
          groupValue:  notificationController.recipient,
          onChanged: (value) {
            if (value != null) {
              notificationController.setTopic(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("Merchant"),
          value: "Merchant",
          groupValue:  notificationController.recipient,
          onChanged: ( value) {
            if (value != null) {
              notificationController.setTopic(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("delivery"),
          value: "delivery",
          groupValue:  notificationController.recipient,
          onChanged: (value) {
            if (value != null) {
              notificationController.setTopic(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("admin"),
          value: "admin",
          groupValue:  notificationController.recipient,
          onChanged: (value) {
            if (value != null) {
              notificationController.setTopic(value);
            }
          },
        ),
      ],
    );
  }
}
