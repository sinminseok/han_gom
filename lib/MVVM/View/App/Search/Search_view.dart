import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../Utils/constans.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';


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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.1,),
          Image.asset("assets/images/map_text.png",height: size.height*0.05,),



          Padding(
            padding: const EdgeInsets.only(left: 34.0,top: 10),
            child: Text("가까운 한의원을 가보세요.",style: TextStyle(fontSize: 25)),
          ),

          SizedBox(height: size.height*0.04,),

          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)
              ),

              width: size.width*0.85,
              height: size.height*0.06,

              child: Center(
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: const  InputDecoration(
                      isDense: true,
                    contentPadding: EdgeInsets.only(left: 20,top: 15),
                    hintText: '어떤 통증이 있나요?',
                    hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: InkWell(

                        child: Icon(Icons.search))
                  ),
                  controller: _searchController,

                ),
              ),

            ),
          ),
          SizedBox(height: size.height*0.03,),

          Center(
            child: Container(

              width: size.width*0.84,
              height: size.height*0.5,
              decoration: BoxDecoration(
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
    );
  }
}
