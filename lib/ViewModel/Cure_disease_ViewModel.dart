import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/Cure_disease_Model.dart';
import '../Model/Cure_tool_Model.dart';

class Cure_disease_ViewModel with ChangeNotifier {

  Cure_disease_Model? _cure_disease_model;

  Cure_disease_Model? get cure_disease_model => _cure_disease_model;

  return_collection_doc_value(String doc_path) async {


    var cure_tool_object = await FirebaseFirestore.instance
        .collection('Doc_data')
        .doc("p4SftzyEJK4nVNIIh0ZH")
        .collection("cure_disease")
        .doc(doc_path)
        .get();

    _cure_disease_model = Cure_disease_Model.fromJson(cure_tool_object.data());
    notifyListeners();
    print(_cure_disease_model!.content);

  }
}
