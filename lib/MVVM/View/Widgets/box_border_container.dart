

import 'package:flutter/cupertino.dart';

import '../../../Utils/constans.dart';

class Box_Border_Container extends StatelessWidget {

  const Box_Border_Container({Key? key,required this.size,required this.text}) : super(key: key);

  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width*0.7,
      height: size.height*0.06,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PrimaryColor, width: 2),
      ),
      child: Center(
        child: Text("$text",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: PrimaryColor),),
      ),
    );
  }
}
