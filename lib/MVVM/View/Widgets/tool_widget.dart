

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Utils/constans.dart';
import 'package:page_transition/page_transition.dart';

import '../App/Home/Home_Details_View/Tool_Widget_detail.dart';

class Tool_Widget extends StatelessWidget {
  const Tool_Widget({Key? key,required this.size,required this.text,required this.assets_image,required this.doc_path}) : super(key: key);
  final Size size;
  final String text;
  final String assets_image;
  final String doc_path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Tool_Detail_View(doc_path: doc_path,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: size.width*0.13,
              height: size.width *0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: SecondaryColor,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(assets_image),
              )
            ),
            Text("$text",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
