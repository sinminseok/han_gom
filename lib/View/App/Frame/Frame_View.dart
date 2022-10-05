import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'drawer/drawer.dart';
import 'widget/bottom_nav_bar.dart';
import '../Home/Home_view.dart';
import '../Mypage/Mypage_View.dart';
import '../Search/Search_view.dart';
import '../Solution/Solution.dart';

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

  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          endDrawer: Frame_Drawer(context),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: Row(
            children: [

            ],
          ),
        ),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CustomBottomNavigationBar(

            iconList: [
              "assets/images/icons/bottom_nav/home_icon.png",
              "assets/images/icons/bottom_nav/solution_icon.png",
              "assets/images/icons/bottom_nav/map_icon.png",

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
