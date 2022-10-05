import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/View/App/Solution/widget/solution_solution_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../Utils/constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home/widget/solution_widget.dart';

class Solution_View extends StatefulWidget {
  const Solution_View({Key? key}) : super(key: key);

  @override
  _Solution_ViewState createState() => _Solution_ViewState();
}

class _Solution_ViewState extends State<Solution_View> {
  List imageList = [Image.asset("assets/images/test1.jpeg")];

  TextEditingController _searchController = TextEditingController();
//      color: Colors.grey.shade100,
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                margin: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0.h),
                child: Image.asset("assets/images/hello_text.png",height: size.height*0.05,)),
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 10.h, 15.w, 0.h),
              child: Text("한의곰 한곰이에요",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 31),),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0.h),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                ),

                width: 320.w,
                height: 40.h,

                child: Center(
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: const  InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(left: 15,top: 10),
                        hintText: '한의원,무엇이 궁금하신가요?',
                        hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search,color: Colors.black,)
                    ),
                    controller: _searchController,

                  ),
                ),

              ),
            ),

            Container(
              width: 390.w,
              height: 180.h,

              margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 170.h,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 7),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),

                      //ClipRRect for image border radius
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: imageList[i]),
                    ),
                    onTap: () {
                      var url = imageList[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),

            Container(
              color: Colors.grey.shade200,
              width: size.width,
              height: size.height*0.013,
            ),

            Container(


              margin: EdgeInsets.fromLTRB(30.w, 20.h, 15.w, 0.h),
              child: Text("이런 질문 자주 들어요!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            ),

            Container(
              width: 390.w,
              height: 300.h,
              child: ListView(
                padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0.h),
                children: [
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),
                  Soultion_Solution_Widget("하읭",context),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
