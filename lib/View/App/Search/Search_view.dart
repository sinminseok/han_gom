import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:han_gom/Utils/permission/permission.dart';
import '../../../../Utils/constans.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import '../../../ViewModel/Account/User_Controller.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Search_View extends StatefulWidget {
  const Search_View({Key? key}) : super(key: key);

  @override
  _Search_ViewState createState() => _Search_ViewState();
}

class _Search_ViewState extends State<Search_View> {
  //WebViewController? _controller;
  static const String URL = "https://dapi.kakao.com/v2/local/search/address";
  static const Map<String, String> HEADERS = {
    "Authorization": "KakaoAK 171fe4c11b6948650bcbbfc60bd37a26"
  };

  WebViewController? webview_controller;
  TextEditingController _searchController = TextEditingController();
  Position? position;
  double? current_lat;
  double? current_lng;
  Future? myFuture;

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
  void initState() {
    // TODO: implement initState
    //Permission_handler().requestlocationPermission(context);
    myFuture = getCurrentLocation();
    super.initState();
  }

  Future<void> search_text({required String searchData}) async {
    final String _data =
        "?query=$searchData&page=1&size=10&analyze_type=similar"; // 기본 값 : page=1&size=10&analyze_type=similar
    final http.Response _res =
        await http.get(Uri.parse(URL + _data), headers: HEADERS);
    final Map<String, dynamic> _result = json.decode(_res.body);

    setState(() {
      current_lat = double.parse(_result["documents"][0]["y"]);
      current_lng = double.parse(_result["documents"][0]["x"]);
    });
    webview_controller!.loadUrl(
        "https://hang-c1561.web.app/?lat=${_result["documents"][0]["y"]}&lng=${_result["documents"][0]["x"]}");

    return;
  }

  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      current_lat = position!.latitude;
      current_lng = position!.longitude;
    });

    return position;
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
    double ratio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print("D");
                print(current_lat);
                print(current_lng);
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(40.w, 5.h, 30.w, 0.h),
                  child: Image.asset(
                    "assets/images/map_text.png",
                    width: 200.w,
                    height: size.height * 0.05,
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 10.h, 15.w, 0.h),
              child: Text(
                "가까운 한의원을 가보세요.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 31),
              ),
            ),
            FutureBuilder(
                future: myFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0.h),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            width: 320.w,
                            height: 40.h,
                            child: Center(
                              child: TextField(
                                onSubmitted: (_) => search_text(
                                    searchData: _searchController.text),
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 20, top: 15),
                                    hintText: '지역을 검색하세요.',
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.search)),
                                controller: _searchController,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 0.h),
                            width: 360.w,
                            height: 450.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ClipRect(
                                // 자르기
                                child: Transform.scale(
                                    // 확대
                                    scale: 1.5,
                                    child: WebView(
                                      initialUrl:
                                          "https://hang-c1561.web.app/?lat=${current_lat}&lng=${current_lng}",
                                      onWebViewCreated: (controller) {
                                        webview_controller = controller;
                                      },
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                    ))),
                          ),
                        ),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

// Center(
// child: Container(
// margin: EdgeInsets.fromLTRB(0.w, 30.h, 0.w, 0.h),
// width: 360.w,
// height: 450.h,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(10)),
//
// ),
// child: WebView(
// initialUrl: "https://hang-c1561.web.app/?lat=${position!.latitude}&lng=${position!.longitude}",
// javascriptMode: JavascriptMode.unrestricted,
// gestureNavigationEnabled: true,
//
// )
//
// ),
// );
