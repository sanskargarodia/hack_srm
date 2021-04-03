import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  getUserByUserEmail(String email) async {
    return await Firestore.instance
        .collection('users')
        .where("email", isEqualTo: email)
        .getDocuments();
  }
}
