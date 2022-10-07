import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:han_gom/View/App/Frame/child_view/Information/My_Info_View.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../../Oauth/Kakao_Oauth/kakao_login.dart';
import '../../../../../Oauth/Kakao_Oauth/main_view_model.dart';
import '../../../../../Utils/constans.dart';
import '../../../Mypage/widget/my_page_listtile.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebaseith;
class Setting_View extends StatelessWidget {
  const Setting_View({Key? key}) : super(key: key);


  void showDefaultHeightModalBottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      builder: (
          BuildContext context,
          ) {
        return SingleChildScrollView(
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30.w, 10.h, 15.w, 0.h),
                      child: Text(
                        "프로필 정보",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(15.w, 10.h, 30.w, 0.h),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close)),
                    )
                  ],
                ),
                Center(
                  child:Container(
                    margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 20.h),
                      width: 360.w,
                      height:90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade500, width: 1),
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
                            child: Text("닉네임 : ${firebaseith.FirebaseAuth.instance!.currentUser!.displayName}",style: TextStyle(),)),
                        Container(
                            margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
                            child: Text("이메일 : ${firebaseith.FirebaseAuth.instance!.currentUser!.email}"))
                      ],
                    ),
                    ),

                )
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = MainViewModel(KakaoLogin());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              showDefaultHeightModalBottomSheet(context,size);
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.fade,
              //         child: My_Info_View(
              //         )));
            },
            child: Mypage_list_tile(size,"내정보",Icon(
              Icons.person_outline,
              color: Colors.black54,
            ),),
          ),

          InkWell(
            onTap: (){
              viewModel.logout();
            },
            child: Mypage_list_tile(size,"로그아웃",Icon(
              Icons.logout,
              color: Colors.black54,
            ),),
          ),

          Mypage_list_tile(size,"계정 삭제",Icon(
            Icons.cancel_outlined,
            color: Colors.black54,
          ),),
        ],
      ),
    );
  }
}
