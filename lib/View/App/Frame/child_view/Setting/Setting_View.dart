import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Oauth/Kakao_Oauth/kakao_login.dart';
import '../../../../../Oauth/Kakao_Oauth/main_view_model.dart';
import '../../../Mypage/widget/my_page_listtile.dart';


class Setting_View extends StatelessWidget {
  const Setting_View({Key? key}) : super(key: key);

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
          Mypage_list_tile(size,"내정보",Icon(
            Icons.person_outline,
            color: Colors.black54,
          ),),

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
