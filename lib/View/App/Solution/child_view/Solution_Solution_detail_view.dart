import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../Utils/constans.dart';

class Solution_Solution_detail_View extends StatelessWidget {
  const Solution_Solution_detail_View({Key? key}) : super(key: key);

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
            children: [
              Container(

                width: size.width,
                height: size.height * 0.23,

                child: Text("title"),
              ),


            ],
          ),
        )
    );
  }
}
