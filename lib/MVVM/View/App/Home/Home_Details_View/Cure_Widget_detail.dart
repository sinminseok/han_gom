import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Utils/constans.dart';
import 'package:han_gom/Utils/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../../../ViewModel/Cure_disease_ViewModel.dart';
import '../../../../ViewModel/Cure_tool_ViewModel.dart';


//치료 가능 질환 상세페이지
class Cure_Detail_View extends StatefulWidget {
  final String? doc_path;

  const Cure_Detail_View({Key? key, required this.doc_path}) : super(key: key);

  @override
  State<Cure_Detail_View> createState() => _Cure_Detail_ViewState();
}

class _Cure_Detail_ViewState extends State<Cure_Detail_View> {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: Provider.of<Cure_disease_ViewModel>(context, listen: false)
              .return_collection_doc_value(widget.doc_path!),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              // Map<String, dynamic> data =
              //     snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.23,
                      color: PrimaryColor,
                      child: Text(
                          "${Provider.of<Cure_disease_ViewModel>(context, listen: false).cure_disease_model!.title}"),
                    ),
                  ],
                ),
              );
            }

            return Text("loading");
          },
        ));
  }
}
