import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Utils/constans.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../child_view/Solution_Solution_detail_view.dart';

Widget Soultion_Solution_Widget(String title,BuildContext context) {
  return InkWell(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: Solution_Solution_detail_View()));
      },
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade100,
            width: 330.w,

            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.w, 5.h, 10.w, 0.h),
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          shape: BoxShape.circle
                      ),
                    ),
                    Text(
                      "$title",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: PrimaryColor),
                    ),

                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),


          ),
          Container(
            margin: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 10.h),
            width: 360.w,height: 1.h,color: Colors.grey.shade300,)
        ],
      )
  );
}
