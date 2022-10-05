

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "gilogfont"),
                ),
              ),
            ],
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