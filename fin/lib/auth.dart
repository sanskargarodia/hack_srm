import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fin/user.dart';

import 'globals.dart' as globals;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anamously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      globals.user_id = user.uid;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      globals.user_id = user.uid;
      globals.email = email;
      print(globals.email);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  DatabaseMethods databaseMethods = DatabaseMethods();
  //register with email and password
  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      FirebaseUser user;

      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      globals.user_id = user.uid;
      Map<String, String> userInfoMap = {
        "name": name,
        "email": email,
        "userId": user.uid
      };
      globals.email = email;

      //create a new document for the user with the uid
      //await DatabaseService(uid: user.uid).updateUserData(name, 0);
      databaseMethods.uploadUserInfo(userInfoMap);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  //signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
