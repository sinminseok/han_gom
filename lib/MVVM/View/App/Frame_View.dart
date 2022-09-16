import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:han_gom/MVVM/View/App/Communication/Communication_view.dart';
import 'package:han_gom/MVVM/View/App/Home/Home_view.dart';
import 'package:han_gom/MVVM/View/App/Mypage/Mypage_View.dart';
import 'package:han_gom/MVVM/View/App/Search/Search_view.dart';
import 'package:han_gom/MVVM/View/App/Solution/Solution.dart';

import '../Widgets/bottom_nav_bar.dart';

class Frame_View extends StatefulWidget {
  const Frame_View({Key? key}) : super(key: key);

  @override
  _Frame_ViewState createState() => _Frame_ViewState();
}

class _Frame_ViewState extends State<Frame_View> {
  int _selectedItem = 0;

  final screens = [
    Home_View(),
    Solution_View(),
    Search_View(),
    MyPage_View()

  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CustomBottomNavigationBar(

            iconList: [
              "assets/images/icons/bottom_nav/home_icon.png",
              "assets/images/icons/bottom_nav/solution_icon.png",
              "assets/images/icons/bottom_nav/map_icon.png",
              "assets/images/icons/bottom_nav/mypage_icon.png",

            ],
            onChange: (val) {
              setState(() {
                _selectedItem = val;
              });
            },
            defaultSelectedIndex: 0,
          ),
          body: screens[_selectedItem]),
    );
  }
}
