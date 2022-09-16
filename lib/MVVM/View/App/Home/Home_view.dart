import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Utils/constans.dart';
import 'package:page_transition/page_transition.dart';
import '../../Widgets/box_border_container.dart';
import '../../Widgets/cure_widget.dart';
import '../../Widgets/solution_widget.dart';
import '../../Widgets/tool_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Home_Details_View/Banner_image_detail_View.dart';
import 'Home_Details_View/Home_Search_View.dart';

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

  List imageList = [Image.asset("assets/images/test1.jpeg")];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/icons/main_icon.png",
          width: size.width * 0.2,
          height: size.height * 0.2,
        ),
        backgroundColor: Colors.white,
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
                  height: size.height * 0.42,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Image.asset("assets/images/test1.jpeg"),
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.24,
                        margin: EdgeInsets.all(15),
                        child: CarouselSlider.builder(
                          itemCount: imageList.length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: size.height * 0.23,
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
                                    border: Border.all(
                                  color: Colors.white,
                                )),
                                //ClipRRect for image border radius
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: imageList[i]),
                              ),
                              onTap: () {
                                var url = imageList[i];
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: Banner_Detail_View()));
                              },
                            );
                          },
                        ),
                      ),
                      Text(
                        "# 한방 진료,무엇이 궁금한 곰?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Home_Search_View()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: PrimaryColor, width: 2),
                            ),

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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, bottom: 20.0),
                        child: Text(
                          "# 한의원 치료도구 _잘 알아야, 잘 받는다!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                          child: Row(

                        children: [
                          Tool_Widget(size: size, text: "침",assets_image: "assets/images/icons/cure_tool_icon/13.png",doc_path: "Acupuncture",),
                          Tool_Widget(size: size, text: "추나요법",assets_image: "assets/images/icons/cure_tool_icon/14.png",doc_path:"Chuna"),
                          Tool_Widget(size: size, text: "부항",assets_image: "assets/images/icons/cure_tool_icon/15.png",doc_path:"Cupping"),
                          Tool_Widget(size: size, text: "뜸",assets_image: "assets/images/icons/cure_tool_icon/16.png",doc_path:"Tteum"),
                          Tool_Widget(size: size, text: "한약",assets_image: "assets/images/icons/cure_tool_icon/17.png",doc_path:"Herbmedicine"),
                        ],
                      )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(
                          child: Row(
                        children: [
                          Tool_Widget(size: size, text: "물리치료",assets_image: "assets/images/icons/cure_tool_icon/18.png",doc_path:"Physiotherapy"),
                          Tool_Widget(size: size, text: "온열요법",assets_image: "assets/images/icons/cure_tool_icon/19.png",doc_path:"Hyperthermia"),
                          Tool_Widget(size: size, text: "맥진",assets_image: "assets/images/icons/cure_tool_icon/20.png",doc_path:"Pulse"),
                          Tool_Widget(size: size, text: "인바디",assets_image: "assets/images/icons/cure_tool_icon/21.png",doc_path:"Inbody"),
                          Tool_Widget(size: size, text: "HRV",assets_image: "assets/images/icons/cure_tool_icon/22.png",doc_path:"Hrv"),
                        ],
                      )),
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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, bottom: 20.0),
                        child: Text(
                          "# 치료 가능한 질환_ 이런 병을 진료해요",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                          child: Row(
                        children: [
                          Cure_disease_Widget(size: size, text: "각종 통증",icon_url: "assets/images/icons/cure_icon/cure_img1.png",doc_path: "Aches",),
                          Cure_disease_Widget(size: size, text: "사고후재활",icon_url: "assets/images/icons/cure_icon/cure_img2.png",doc_path: "Rehabilitation",),
                          Cure_disease_Widget(size: size, text: "산부인과",icon_url: "assets/images/icons/cure_icon/cure_img3.png",doc_path: "Obstetrics",),
                          Cure_disease_Widget(size: size, text: "신경정신과",icon_url: "assets/images/icons/cure_icon/cure_img4.png",doc_path: "Nervousmind",),
                          Cure_disease_Widget(size: size, text: "피부과",icon_url: "assets/images/icons/cure_icon/cure_img5.png",doc_path: "Dermatology",),
                        ],
                      )),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(
                          child: Row(
                        children: [
                          Cure_disease_Widget(size: size, text: "이비인후과",icon_url: "assets/images/icons/cure_icon/cure_img6.png",doc_path: "Otorhinolaryngology",),
                          Cure_disease_Widget(size: size, text: "소화기내과",icon_url: "assets/images/icons/cure_icon/cure_img7.png",doc_path: "Digest",),
                          Cure_disease_Widget(size: size, text: "비뇨기과",icon_url: "assets/images/icons/cure_icon/cure_img8.png",doc_path: "Urology",),
                          Cure_disease_Widget(size: size, text: "체형문제",icon_url: "assets/images/icons/cure_icon/cure_img9.png",doc_path: "PhysicalProblem",),
                          Cure_disease_Widget(size: size, text: "기타질환",icon_url: "assets/images/icons/cure_icon/cure_img10.png",doc_path: "Otherdiseases",),
                        ],
                      )),
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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                        child: Text(
                          "# 곰곰해결소 _ 이런 질문을 자주 들어요",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Soultion_Widget("한의학 비과학적인 학문 아닌가용",context),
                      Soultion_Widget("한의학 비과학적인 학문 아닌가용",context),
                      Soultion_Widget("한의학 비과학적인 학문 아닌가용",context),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Box_Border_Container(
                              size: size,
                              text: "+ 자주 묻는 질문 보기",
                            )),
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
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "# 피드백은 언제나 환영한 곰",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " 고객센터 운영 시 ( 10:00 ~ 18:00 )",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Box_Border_Container(
                            size: size,
                            text: "고객 센터 연결하기",
                          ))
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
