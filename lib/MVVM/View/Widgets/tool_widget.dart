

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Utils/constans.dart';

class Tool_Widget extends StatelessWidget {
  const Tool_Widget({Key? key,required this.size,required this.text}) : super(key: key);
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            width: size.width*0.13,
            height: size.width *0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: SecondaryColor,
            ),
          ),
          Text("$text",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
