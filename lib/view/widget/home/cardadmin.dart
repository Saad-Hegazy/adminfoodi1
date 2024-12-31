import 'package:flutter/material.dart';

class CardAdminHome  extends StatelessWidget {
  final void Function()? onClick;
  final String url;
  final String title;
   const CardAdminHome({super.key, required this.url, required this.title,required this.onClick});
  @override
  Widget build(BuildContext context) {
            return   InkWell(
            onTap: onClick,
        child: Card(
        child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Image.asset(url,width: 80,),
        Text("$title")
        ],
        ),
        ),
        );
  }
}
