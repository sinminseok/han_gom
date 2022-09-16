

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Banner_Detail_View extends StatelessWidget {
  const Banner_Detail_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: size.width*0.9,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(.0)),
                  //   color: Colors.redAccent,
                  // ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/test1.jpeg"))),
            )
          ],

        ),
    ),
    );
  }
}
