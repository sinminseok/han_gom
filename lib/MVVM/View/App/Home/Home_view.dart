import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Utils/constans.dart';

import '../../Widgets/box_border_container.dart';
import '../../Widgets/cure_widget.dart';
import '../../Widgets/tool_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home_View extends StatefulWidget {
  const Home_View({Key? key}) : super(key: key);

  @override
  _Home_ViewState createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  List  items = ["assets/images/test1.jpeg"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(

          child: Column(
            children: [
              //image slider main
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("# 한방 진료,무엇이 궁금한 곰?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      // Image.asset("assets/images/test1.jpeg"),
                      CarouselSlider(
                          items: items,
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            //onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          )
                      ),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.06,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: PrimaryColor, width: 2),
                      ),
                      child: Center(
                        child: TextField(

                          cursorColor: PrimaryColor,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                            ),
                            prefixIcon: Icon(Icons.search,color: PrimaryColor,),
                          ),
                          controller: _searchController,

                        ),
                      ),
                    )

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 20.0,bottom: 20.0),
                        child: Text("# 한의원 치료도구 _잘 알아야, 잘 받는다!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),

                      Center(
                          child: Row(
                            children: [
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                            ],
                          )
                      ),
                      SizedBox(height: size.height*0.05,),
                      Center(
                          child: Row(
                            children: [
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                              Tool_Widget(size: size, text:"각종 통증"),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 20.0,bottom: 20.0),
                        child: Text("# 치료 가능한 질환_ 이런 병을 진료해요",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),

                      Center(
                          child: Row(
                            children: [
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                            ],
                          )
                      ),
                      SizedBox(height: size.height*0.05,),
                      Center(
                          child: Row(
                            children: [
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                              Cure_Widget(size: size, text:"각종 통증"),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 30.0),
                        child: Text("# 곰곰해결소 _ 이런 질문을 자주 들어요",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        color: Colors.white,
                        child: Material(
                          child: ListTile(
                            title: Row(
                              children: [
                                Text("한의학 비과학적인 학문 아닌가요?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: PrimaryColor),)
                              ],
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                            tileColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Material(
                          child: ListTile(
                            title: Row(
                              children: [
                                Text("한약 먹으면 간수치 올라간다던데요?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: PrimaryColor),)
                              ],
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                            tileColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Material(
                          child: ListTile(
                            title: Row(
                              children: [
                                Text("한의사도 전문의가 있어요?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: PrimaryColor),)
                              ],
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                            tileColor: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Box_Border_Container(size: size,text: "+ 자주 묻는 질문 보기",)
                        ),
                      )

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.23,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("# 피드백은 언제나 환영한 곰",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(" 고객센터 운영 시 ( 10:00 ~ 18:00 )",style: TextStyle(fontSize: 16),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Box_Border_Container(size: size,text: "고객 센터 연결하기",)
                      )
                    ],
                  ),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
