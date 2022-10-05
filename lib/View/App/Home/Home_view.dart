import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/Data/const_data.dart';
import 'package:han_gom/Utils/constans.dart';
import 'package:page_transition/page_transition.dart';
import 'child_view/Banner_image_detail_View.dart';
import 'child_view/Home_Search_View.dart';
import 'widget/box_border_container.dart';
import 'widget/cure_widget.dart';
import 'widget/solution_widget.dart';
import 'widget/tool_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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
      backgroundColor: Colors.grey.shade300,

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image slider main
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                width: 390.w,
                height: 310.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 9), // changes position of shadow
                    ),
                  ],
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Image.asset("assets/images/test1.jpeg"),
                    Container(
                      width: 360.w,
                      height: 180.h,
                      margin: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0.h),
                      child: CarouselSlider.builder(
                        itemCount: imageList.length,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 180.h,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 7),
                          reverse: false,
                          aspectRatio: 5.0,
                        ),
                        itemBuilder: (context, i, id) {
                          //for onTap to redirect to another screen
                          return GestureDetector(
                            child: Container(

                              //ClipRRect for image border radius
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 10.h),
                      child: Text(
                        "# 한방 진료,무엇이 궁금한 곰?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Hangomfont_Bold"),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Home_Search_View()));
                      },
                      child: Container(
                        width: 320.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: PrimaryColor, width: 2),
                        ),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 0.h),
                                child: Icon(Icons.search)),
                            Text("어떤 통증이 있나요?",style: TextStyle(color: Colors.grey.shade500),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
                width: 390.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15.w, 15.h, 0.w, 0.h),
                      child: Text(
                        "# 한의원 치료도구 _잘 알아야, 잘 받는다!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Hangomfont_Bold"),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0.h),
                        width: 360.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Tool_Widget(
                              size: size,
                              text: "침",
                              assets_image:
                                  "assets/images/icons/cure_tool_icon/13.png",
                              doc_path: "Acupuncture",
                            ),
                            Tool_Widget(
                                size: size,
                                text: "추나요법",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/14.png",
                                doc_path: "Chuna"),
                            Tool_Widget(
                                size: size,
                                text: "부항",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/15.png",
                                doc_path: "Cupping"),
                            Tool_Widget(
                                size: size,
                                text: "뜸",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/16.png",
                                doc_path: "Tteum"),
                            Tool_Widget(
                                size: size,
                                text: "한약",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/17.png",
                                doc_path: "Herbmedicine"),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),



                        width: 360.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Tool_Widget(
                                size: size,
                                text: "물리치료",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/18.png",
                                doc_path: "Physiotherapy"),
                            Tool_Widget(
                                size: size,
                                text: "온열요법",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/19.png",
                                doc_path: "Hyperthermia"),
                            Tool_Widget(
                                size: size,
                                text: "맥진",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/20.png",
                                doc_path: "Pulse"),
                            Tool_Widget(
                                size: size,
                                text: "인바디",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/21.png",
                                doc_path: "Inbody"),
                            Tool_Widget(
                                size: size,
                                text: "HRV",
                                assets_image:
                                    "assets/images/icons/cure_tool_icon/22.png",
                                doc_path: "Hrv"),
                          ],
                        )),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
                width: 390.w,
                height: 250.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),
                      child: Text(
                        "# 치료 가능한 질환_ 이런 병을 진료해요",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Hangomfont_Bold"),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),
                        width: 360.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cure_disease_Widget(
                              size: size,
                              text: "각종 통증",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img1.png",
                              doc_path: "Aches",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "사고후재활",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img2.png",
                              doc_path: "Rehabilitation",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "산부인과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img3.png",
                              doc_path: "Obstetrics",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "신경정신과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img4.png",
                              doc_path: "Nervousmind",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "피부과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img5.png",
                              doc_path: "Dermatology",
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),
                        width: 360.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cure_disease_Widget(
                              size: size,
                              text: "이비인후과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img6.png",
                              doc_path: "Otorhinolaryngology",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "소화기내과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img7.png",
                              doc_path: "Digest",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "비뇨기과",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img8.png",
                              doc_path: "Urology",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "체형문제",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img9.png",
                              doc_path: "PhysicalProblem",
                            ),
                            Cure_disease_Widget(
                              size: size,
                              text: "기타질환",
                              icon_url:
                                  "assets/images/icons/cure_icon/cure_img10.png",
                              doc_path: "Otherdiseases",
                            ),
                          ],
                        )),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
                width: 390.w,
                height: 310.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 15.h),

                      child: Text(
                        "# 곰곰해결소 _ 이런 질문을 자주 들어요",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Hangomfont_Bold"),
                      ),
                    ),
                    Home_Soultion_Widget("한의학 비과학적인 학문 아닌가용", context),
                    Home_Soultion_Widget("한의학 비과학적인 학문 아닌가용", context),
                    Home_Soultion_Widget("한의학 비과학적인 학문 아닌가용", context),
                    Center(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0.h),
                          child: Box_Border_Container(
                            size: size,
                            text: "+ 자주 묻는 질문 보기",
                          )),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0.h),
                width: 390.w,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30.w, 0.h, 0.w, 0.h),
                      child: Text(
                        "# 피드백은 언제나 환영한 곰",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Hangomfont_Bold"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 0.h),
                      child: Text(
                        " 고객센터 운영 시 ( 10:00 ~ 18:00 )",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    InkWell(
                      onTap: ()async{
                        const number = '01091741764'; //set the number here
                        bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                      },
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0.h),
                            child: Box_Border_Container(
                              size: size,
                              text: "고객 센터 연결하기",
                            )),
                      ),
                    )
                  ],
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
