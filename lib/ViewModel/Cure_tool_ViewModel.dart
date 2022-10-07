import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/Cure_tool_Model.dart';

class Cure_tool_ViewModel with ChangeNotifier {

  Cure_tool_Model? _cure_tool_Model;
  Cure_tool_Model? get cure_tool_Model => _cure_tool_Model;

  return_collection_doc_value(String doc_path) async {


    var cure_tool_object = await FirebaseFirestore.instance
        .collection('Doc_data')
        .doc("p4SftzyEJK4nVNIIh0ZH")
        .collection("cure_tool")
        .doc(doc_path)
        .get();

    _cure_tool_Model = Cure_tool_Model.fromJson(cure_tool_object.data());
    notifyListeners();

    // Cure_tool_Model tet = cure_tool_object.
  }
}
