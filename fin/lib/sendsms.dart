import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'globals.dart' as globals;
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Sendsms extends StatefulWidget {
  @override
  _SendsmsState createState() => new _SendsmsState();
}

class _SendsmsState extends State<Sendsms> {
  AuthService _authService = AuthService();
  List<String> contacts;

  Future<List<String>> getContacts() async {
    print(globals.email);
    String email = globals.email;
  }

  String body;
  List<String> people = [];

  void _sendSMS(String message) async {
    List<String> recipents = List<String>();
    Future uid = _authService.getCurrentUser();
    String email = Firestore.instance
        .collection("user")
        .where("userId", isEqualTo: uid)
        .toString();
    QuerySnapshot snapshotUserInfo = await Firestore.instance
        .collection("emergency_contacts")
        .document(email)
        .collection("contacts")
        .getDocuments();

    snapshotUserInfo.documents.map((doc) {
      doc != null ? recipents.add(doc.data["phoneNo"]) : print("Null object");
    }).toList();
    Navigator.pop(context);
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents);
    // _sendSMS("Please Help I am in Danger", ['5566543454', "26589477788"]);

    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    String latitude;
    String longitude;
    void getlocation() async {
      LocationPermission permission = await Geolocator.requestPermission();
      StreamSubscription<Position> positionStream =
          Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best)
              .listen((Position position) {
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      });
    }

    getlocation();

    FlutterOpenWhatsapp.sendSingleMessage("", "Please Help me!");
    _sendSMS('Please Help !!!');

    // ignore: unnecessary_parenthesis
    return Container();
  }
}
