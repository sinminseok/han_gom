

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../child_view/Cure_Widget_detail.dart';
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
      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                ),
                Image.asset(icon_url,height: 45.h,width: 45.w,)
              ],
            ),
            Text("$text",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
