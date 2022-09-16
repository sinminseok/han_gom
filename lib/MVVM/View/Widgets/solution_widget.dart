import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/constans.dart';
import 'package:page_transition/page_transition.dart';

import '../App/Home/Home_Details_View/Solution_detail_View.dart';
Widget Soultion_Widget(String title,BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Solution_detail_View()));
    },
    child: Container(
      color: Colors.grey.shade200,
      child: Material(
        child: ListTile(
          title: Row(
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: PrimaryColor),
              )
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          tileColor: Colors.white,
        ),
      ),
    ),
  );
}
