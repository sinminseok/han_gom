
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:han_gom/View/App/Account/SignUp_View.dart';
import 'package:han_gom/View/App/Frame/child_view/Setting/Setting_View.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseaith;

import '../../Account/SignIn_View.dart';

Widget Frame_Drawer(BuildContext context){
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey.shade300,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 100.h,

          child: Container(
            margin: EdgeInsets.fromLTRB(10.w, 50.h, 10.w, 0.h),
            child:
                StreamBuilder<firebaseaith.User?>(
                  stream: firebaseaith.FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${firebaseaith.FirebaseAuth.instance!.currentUser!.displayName}",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("${firebaseaith.FirebaseAuth.instance!.currentUser!.email}")
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: Setting_View()));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
                                child: Icon(Icons.settings)),
                          )
                        ],
                      );
                    }else{
                      return InkWell(
                          onTap: (){
                            print("ontap");
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: SignIn_View(
                                    )));
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h),
                              child: Row(
                                children: [
                                  Icon(Icons.login,size: 15,),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(5.w, 0.h, 0.w, 0.h),
                                      child: Text("클릭해서 로그인을 진행해주세요")),
                                ],
                              )));
                    }
                  },
                ),




          ),
        ),
       Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height:MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
              border: Border( bottom: BorderSide(color: Colors.grey.shade300))
            ),
            margin: EdgeInsets.fromLTRB(10.w, 18.h, 10.w, 0.h),
            child: Container(

                child: InkWell(


                    child: Text("이용 방법"))),
          ),

        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height:MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
              border: Border( bottom: BorderSide(color: Colors.grey.shade300))
          ),
          margin: EdgeInsets.fromLTRB(10.w, 18.h, 10.w, 0.h),
          child: Container(

              child: Text("이용 약관")),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height:MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
              border: Border( bottom: BorderSide(color: Colors.grey.shade300))
          ),
          margin: EdgeInsets.fromLTRB(10.w, 18.h, 10.w, 0.h),
          child: Container(

              child: Text("고객센터 문의")),
        ),


      ],
    ),
    
  );
}