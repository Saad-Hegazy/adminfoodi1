import 'package:adminfoodi1/core/class/handlingdataview.dart';
import 'package:adminfoodi1/core/constant/color.dart';
import 'package:adminfoodi1/core/functions/validinput.dart';
import 'package:adminfoodi1/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/categories/edit_controller.dart';
import '../../../core/shared/custombutton.dart';
class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategorieEditController controlle =Get.put(CategorieEditController()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Categories"),
      ),
      body: GetBuilder<CategorieEditController>(builder: (controller)=> HandlingDataView(
          statusRequest: controller.statusRequest!, widget: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.formState ,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                  hinttext: "Edit Categorie Name",
                  labeltext: "categorie name",
                  iconData: Icons.category,
                  mycontroller: controlle.name,
                  valid: (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              CustomTextFormGlobal(
                  hinttext:  "categorie name (Arabic)",
                  labeltext: "categorie name (Arabic)",
                  iconData: Icons.category,
                  mycontroller:  controlle.namear,
                  valid:  (val){
                    return validInput(val!, 1, 200, "");
                  },
                  isNumber: false),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  color: AppColor.primaryColor,
                  textColor: AppColor.secondColor,
                  onPressed: (){
                    controlle.chooseImage();
                  },child:
                Text("Choose Categorie Image",style: TextStyle(color: Colors.white),),),
              ),
              if(controlle.file !=null)
                SvgPicture.file(controlle.file!),
              CustomButton(text: "Edit",
                onPressed: (){
                  controlle.editData();
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}
