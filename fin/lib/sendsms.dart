import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin/auth.dart';
import 'package:fin/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'globals.dart' as globals;
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:keyboard_shortcuts/keyboard_shortcuts.dart';

class Sendsms extends StatefulWidget {
  @override
  _SendsmsState createState() => new _SendsmsState();
}

class _SendsmsState extends State<Sendsms> {
  User user = User();
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC8da64d58db69ad418e850166db87d3ea',
        authToken: '62f322efbac8448dbc99b78a1c4975f5',
        twilioNumber: '+19282385140');
    super.initState();
  }

  TwilioFlutter twilioFlutter;
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

    QuerySnapshot snapshotUserInfo = await Firestore.instance
        .collection("emergency_contacts")
        .document("default")
        .collection("contacts")
        .getDocuments();

    snapshotUserInfo.documents.map((doc) {
      doc.data["phoneNo"] != null
          ? recipents.add(doc.data["phoneNo"].toString())
          : print("Null object");
    }).toList();
    Navigator.pop(context);
    // for (String task in recipents) {
    //   twilioFlutter.sendSMS(
    //       toNumber: task,
    //       messageBody: 'Hii everyone this is a demo of\nflutter twilio sms.');
    // }
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents);

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

    //FlutterOpenWhatsapp.sendSingleMessage("", "Please Help me!");
    _sendSMS('I need your help.Please contact to nearest Police Station !!!');

    // ignore: unnecessary_parenthesis
    return Container();
  }
}
