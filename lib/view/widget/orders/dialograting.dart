import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/ontheway_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';



void showDialogRating(BuildContext context , String ordersId){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.logo,width: 200,height: 200,),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
        color: AppColor.primaryColor,
        fontWeight:FontWeight.bold ,

      ),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OnTheWayOrdersController controller = Get.find() ;
      //  controller.submitRating( ordersId, response.comment, response.rating.toString() );
      },
    ),
  );
}