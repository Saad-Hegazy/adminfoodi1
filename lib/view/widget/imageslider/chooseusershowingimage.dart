import 'package:flutter/material.dart';

import '../../../controller/imageslider/imageslideradd_controller.dart';
class chooseUserType extends StatelessWidget {
  const chooseUserType({
    super.key,
    required this.addImageSliderController,
  });
  final AddImageSliderController addImageSliderController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "choose user not showing the image",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          title: const Text("Normal User"),
          value: "Normal User",
          groupValue: addImageSliderController.imageSliderusertype,
          onChanged: ( value) {
            if (value != null) {
              addImageSliderController.setUserType(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("Mosque"),
          value: "mosque",
          groupValue: addImageSliderController.imageSliderusertype,
          onChanged: (value) {
            if (value != null) {
              addImageSliderController.setUserType(value);
            }
          },
        ),
        RadioListTile(
          title: const Text("Merchant"),
          value: "Merchant",
          groupValue: addImageSliderController.imageSliderusertype,
          onChanged: ( value) {
            if (value != null) {
              addImageSliderController.setUserType(value);
            }
          },
        ),
      ],
    );
  }
}
