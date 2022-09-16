

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Mypage_list_tile(Size size,String title,Icon icon) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(color: Colors.black, width: 0.1)),
    ),
    child: ListTile(
      title: Row(
        children: [
          icon,
          SizedBox(
            width: size.width * 0.02,
          ),
          Text(
            "$title",
            style: TextStyle(
                color: Colors.black, fontFamily: "gilogfont"),
          ),
          SizedBox(
            width: size.width * 0.6,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black54,
          )
        ],
      ),
    ),
  );
}