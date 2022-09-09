

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cure_Widget extends StatelessWidget {
  const Cure_Widget({Key? key,required this.size,required this.text}) : super(key: key);
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            width: size.width*0.12,
            height: size.width *0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade200,
            ),
          ),
          Text("$text",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
