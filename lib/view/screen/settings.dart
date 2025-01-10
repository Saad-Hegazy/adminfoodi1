import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/settings_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imgaeasset.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      color:AppColor.backgroundcolor,
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage(AppImageAsset.avatar),
                      ),
                    )),
              ]),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () async{
                    await  launchUrl(Uri.parse("tel:+97337044837"));
                  },
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact with developer"),
                ),
                ListTile(
                  onTap: () async{
                    await  launch("https://wa.me/37044837");
                  },
                  trailing: const Icon(Icons.message),
                  title:  Text("Contact us whatsapp "),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}