

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Utils/constans.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../child_view/Tool_Widget_detail.dart';
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
      child:  Column(
        children: [
          Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: SecondaryColor,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(assets_image),
              )
          ),
          Text("$text",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
