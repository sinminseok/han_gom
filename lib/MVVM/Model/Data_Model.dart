import 'package:firestore_search/firestore_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? title;
  final String? content;

  DataModel({this.title, this.content});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(title: dataMap['title'], content: dataMap['content']);
    }).toList();
  }
}
