import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/my_page_listtile.dart';

class MyPage_View extends StatelessWidget {
  const MyPage_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height*0.1,),
          Mypage_list_tile(size,"이용안내",Icon(
            Icons.info_rounded,
            color: Colors.black54,
          ),),
          Mypage_list_tile(size,"로그아웃",Icon(
            Icons.logout,
            color: Colors.black54,
          ),),
          Mypage_list_tile(size,"계정 탈퇴",Icon(
            Icons.close,
            color: Colors.black54,
          ),),
          Container(
            decoration: BoxDecoration(
              border:
              Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
            ),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "한곰 버전",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "gilogfont"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "1.0.0",
                      style: TextStyle(fontFamily: "gilogfont"),
                    ),
                  ),
                  

                ],
              ),
            ),
          ),
          SizedBox(height: size.height*0.45,),
          Text("@Copyright 박신현",style: TextStyle(color: Colors.grey,fontSize: 15),),
          Text("고객센터 tel) 010-9174-1764",style: TextStyle(color: Colors.grey,fontSize: 15),),

        ],
      ),
    );
  }
}
