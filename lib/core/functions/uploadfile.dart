import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/color.dart';
imageUploadCamera()async{
  final file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 90);
  if(file != null){
    return File(file.path);
  }else{
    return null;
  }
}

Future<dynamic> fileUploadGallery([bool isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  if (result != null) {
    if (kIsWeb) {
      // On Web: Return `bytes` (Uint8List) and file name as it's the only option available
      Uint8List? fileBytes = result.files.single.bytes;
      String fileName = result.files.single.name;
      return {"bytes": fileBytes, "name": fileName}; // Return both file name and data
    } else {
      // On Mobile/Desktop: Return a `File` object using `path`
      return File(result.files.single.path!); // This is for mobile platforms (Android/iOS)
    }
  } else {
    return null; // No file selected
  }
}

showbottommenu(imageUploadCamera(),fileUploadGallery()){
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Container(
              child: const Text("Choose Image",
              style: TextStyle(fontSize: 22,color: AppColor.primaryColor,
                  fontWeight:FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: (){
                imageUploadCamera();
                },
                leading:  const Icon(
                Icons.image,
                size: 40,
                ),
                title: const Text("Image From Camera",
                style:  TextStyle(fontSize: 20),),
                ),
            ListTile(
              onTap: (){
                fileUploadGallery();
                Get.back();
              },
              leading:  const Icon(
                Icons.image,
                size: 40,
              ),
              title: const Text("Image From Gallery",
              style:  TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    ),
      backgroundColor:Colors.white
  );
}