import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:han_gom/MVVM/View/App/Home/Home_Details_View/Cure_Widget_detail.dart';
import 'package:han_gom/MVVM/View/App/Home/Home_Details_View/Tool_Widget_detail.dart';
import '../../../../../Utils/constans.dart';
import '../../../../Model/Cure_disease_Model.dart';
import '../../../../Model/Cure_tool_Model.dart';
import '../../../../Model/Data_Model.dart';
import 'package:page_transition/page_transition.dart';


//Home에 있는 검색버튼 눌렀을대 나오는 검색 페이지
class Home_Search_View extends StatefulWidget {
  const Home_Search_View({Key? key}) : super(key: key);

  @override
  _Home_Search_ViewState createState() => _Home_Search_ViewState();
}

class _Home_Search_ViewState extends State<Home_Search_View> {
  TextEditingController _searchController = TextEditingController();
  //firebase에 있는 cure_tool데이터 담을 변수
  var cure_tooldata_firebase;
  //firebase에 있는 cure_disease데이터 담을 변수
  var cure_diseasedata_firebase;

  //firebase에서 받아온 cure_tool 데이터 디코딩하고 넣어줄 리스트
  List<Cure_tool_Model> Cure_tool_Model_List = [];

  List<Cure_disease_Model> Cure_disease_Model_List = [];

  //검색결과후 보여줄 cure_tool_list
  List<Cure_tool_Model>? search_cure_tool_list = [];

  //검색결과후 보여줄 cure_disease_list
  List<Cure_disease_Model>? search_cure_disease_list = [];

  @override
  void initState() {
    //치료도구 불러오는 함수
    call_curetool_firebase_get();
    call_curedisease_firebase_get();
    super.initState();
  }

  call_curetool_firebase_get() async {
    //cure_tool을 list로 변환
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('Doc_data')
        .doc("p4SftzyEJK4nVNIIh0ZH")
        .collection("cure_tool");
    print(_collectionRef);
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    cure_tooldata_firebase = querySnapshot.docs.map((doc) => doc.data()).toList();


    filter_data();
  }

  call_curedisease_firebase_get() async {
    //cure_tool을 list로 변환
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('Doc_data')
        .doc("p4SftzyEJK4nVNIIh0ZH")
        .collection("cure_disease");

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    cure_diseasedata_firebase = querySnapshot.docs.map((doc) => doc.data()).toList();


    filter_data2();
  }


  filter_data() {
    //맵핑
    for (var i = 0; i < cure_tooldata_firebase.length; i++) {
      var data = Cure_tool_Model.fromJson(cure_tooldata_firebase[i]);
      Cure_tool_Model_List.add(data);
    }


  }

  filter_data2() {
    //맵핑
    for (var i = 0; i < cure_diseasedata_firebase.length; i++) {
      var data = Cure_disease_Model.fromJson(cure_diseasedata_firebase[i]);
      Cure_disease_Model_List.add(data);
    }


  }

  search_results() {
    for (var i = 0; i < Cure_tool_Model_List.length; i++) {
      print(Cure_tool_Model_List[i].title);
      if (Cure_tool_Model_List[i].title!.contains(_searchController.text)) {
        setState(() {
          search_cure_tool_list!.add(Cure_tool_Model_List[i]);
        });
      }
    }

    for (var i = 0; i < Cure_disease_Model_List.length; i++) {
      print(Cure_disease_Model_List[i].title);
      if (Cure_disease_Model_List[i].title!.contains(_searchController.text)) {
        setState(() {
          search_cure_disease_list!.add(Cure_disease_Model_List[i]);
        });
      }
    }

    print("result:$search_cure_disease_list");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "검색",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // test();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 36, bottom: 10),
                child: Text(
                  "#한방 진료,무엇이 궁금한 곰?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.88,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: PrimaryColor, width: 2),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  search_cure_tool_list = [];
                                  search_cure_disease_list = [];
                                });

                                if (_searchController.text == "") {
                                  return;
                                } else {
                                  search_results();

                                }
                              },
                              child: Icon(Icons.search)),
                          hintText: 'Username'
                      ),
                      controller: _searchController,


                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: size.width,
                height: size.height * 0.02,
                color: Colors.grey.shade200,
              ),
            ),
            search_cure_tool_list!.length == 0
                ? Container()
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "#한의원 치료도구 잘 알아야 잘 받는다!",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  child: ListView.builder(
                      itemCount: search_cure_tool_list!.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return InkWell(
                          onTap: () {

                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Tool_Detail_View(doc_path: search_cure_tool_list![idx].doc_path,)));
                          },
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Material(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${search_cure_tool_list![idx].title}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: PrimaryColor),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: size.width * 0.5,
                                            child: Text(
                                              "${search_cure_tool_list![idx].content}",
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),

            search_cure_disease_list!.length == 0
                ? Container()
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "#치료 가능한 질환_ 이런 병을 진료해요",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  child: ListView.builder(
                      itemCount: search_cure_disease_list!.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return InkWell(
                          onTap: () {

                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Cure_Detail_View(doc_path: search_cure_disease_list![idx].doc_path,)));
                          },
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Material(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${search_cure_disease_list![idx].title}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: PrimaryColor),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: size.width * 0.5,
                                            child: Text(
                                              "${search_cure_disease_list![idx].content}",
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                                tileColor: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
