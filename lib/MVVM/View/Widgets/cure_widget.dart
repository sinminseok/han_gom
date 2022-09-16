

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../App/Home/Home_Details_View/Cure_Widget_detail.dart';
import 'package:page_transition/page_transition.dart';
class Cure_disease_Widget extends StatelessWidget {
  const Cure_disease_Widget({Key? key,required this.size,required this.text,required this.icon_url,required this.doc_path}) : super(key: key);
  final Size size;
  final String text;
  final String icon_url;
  final String doc_path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Cure_Detail_View(doc_path: doc_path,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width*0.12,
                  height: size.width *0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                ),
                Image.asset(icon_url,height: size.width *0.12,width: size.width*0.12)
              ],
            ),
            Text("$text",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
