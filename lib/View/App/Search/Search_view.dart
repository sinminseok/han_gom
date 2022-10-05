import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../Utils/constans.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ViewModel/Account/User_Controller.dart';

class Search_View extends StatefulWidget {
  const Search_View({Key? key}) : super(key: key);

  @override
  _Search_ViewState createState() => _Search_ViewState();
}

class _Search_ViewState extends State<Search_View> {
  WebViewController? _controller;

  TextEditingController _searchController = TextEditingController();

  void showDefaultHeightModalBottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      builder: (
          BuildContext context,
          ) {
        return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "사전식 정보",
                        style: TextStyle(
                            fontSize: 18,
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close)),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.87,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: PrimaryColor, width: 2),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(40.w, 5.h, 30.w, 0.h),
                child: Image.asset("assets/images/map_text.png",width: 200.w,height: size.height*0.05,)),
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 10.h, 15.w, 0.h),
              child: Text("가까운 한의원을 가보세요.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 31),),
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
                        contentPadding: EdgeInsets.only(left: 20,top: 15),
                        hintText: '지역을 검색하세요.',
                        hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search)
                    ),
                    controller: _searchController,

                  ),
                ),

              ),
            ),



            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 10.h),
                width: 320.w,
                height: 450.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: WebView(


                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: "http://localhost:3000/",
                  onWebViewCreated:
                      (WebViewController webviewController) {
                    _controller = webviewController;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
