import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../Utils/constans.dart';


class Solution_View extends StatefulWidget {
  const Solution_View({Key? key}) : super(key: key);

  @override
  _Solution_ViewState createState() => _Solution_ViewState();
}

class _Solution_ViewState extends State<Solution_View> {
  List imageList = [Image.asset("assets/images/test1.jpeg")];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.1,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/hello_text.png",height: size.height*0.05,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Text("한의곰 한곰이에요",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 31),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Center(
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
                        suffixIcon: Icon(Icons.search)
                    ),
                    controller: _searchController,

                  ),
                ),

              ),
            ),
          ),

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

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("이런 질문 자주 들어요!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Material(
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          "한의학 비과학적인 학문 아닌가요?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),
                        )
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
                        Text(
                          "한의학 비과학적인 학문 아닌가요?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),
                        )
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
                        Text(
                          "한의학 비과학적인 학문 아닌가요?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor),
                        )
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    tileColor: Colors.white,
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
