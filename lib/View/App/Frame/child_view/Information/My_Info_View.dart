
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseith;

class My_Info_View extends StatelessWidget {
  const My_Info_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [

          Text("${firebaseith.FirebaseAuth.instance!.currentUser!.displayName}",style: TextStyle(fontWeight: FontWeight.bold),),
          Text("${firebaseith.FirebaseAuth.instance!.currentUser!.email}")

        ],
      ),
    );
  }
}
