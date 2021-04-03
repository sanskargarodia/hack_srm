import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'globals.dart' as globals;

class Sendsms extends StatefulWidget {
  @override
  _SendsmsState createState() => new _SendsmsState();
}

class _SendsmsState extends State<Sendsms> {
  List<String> contacts;

  Future<List<String>> getContacts() async {
    print(globals.email);
    String email = globals.email;
  }

  String body;
  List<String> people = [];

  void _sendSMS(String message) async {
    List<String> recipents = List<String>();
    QuerySnapshot snapshotUserInfo = await Firestore.instance
        .collection("emergency_contacts")
        .document("teamingenuus@gmail.com")
        .collection("contacts")
        .getDocuments();

    snapshotUserInfo.documents.map((doc) {
      doc != null ? recipents.add(doc.data["phoneNo"]) : print("Null object");
    }).toList();

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

    _sendSMS('Please Help !!!');

    // ignore: unnecessary_parenthesis
    return Container();
  }
}
