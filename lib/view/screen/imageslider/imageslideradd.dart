import 'package:adminfoodi1/core/class/handlingdataview.dart';
import 'package:adminfoodi1/core/constant/color.dart';
import 'package:adminfoodi1/core/functions/validinput.dart';
import 'package:adminfoodi1/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/imageslider/imageslideradd_controller.dart';
import '../../../core/shared/custombutton.dart';
import '../../widget/imageslider/chooseusershowingimage.dart';
class ImageSliderAdd extends StatelessWidget {
  const ImageSliderAdd({super.key});
  @override
  Widget build(BuildContext context) {
    AddImageSliderController controlle =Get.put(AddImageSliderController()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Image"),
      ),
      body: GetBuilder<AddImageSliderController>(builder: (controller)=> HandlingDataView(

          statusRequest: controller.statusRequest!, widget: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formState ,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                  hinttext: "Add Image Name",
                  labeltext: "Image name",
                  iconData: Icons.category,
                  mycontroller: controlle.imageslidername,
                  valid: (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              chooseUserType(addImageSliderController: controller,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  color: AppColor.primaryColor,
                  onPressed: (){
                    controlle.chooseImage();
                  },child:
                Text("Choose Image Slider",style: TextStyle(color: Colors.white),),),
              ),
              if(controlle.file !=null)
                Image.file(controlle.file!),
              CustomButton(text: "Add",
                onPressed: (){
                  controlle.addData();
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}
