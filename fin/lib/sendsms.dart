import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';

class Sendsms extends StatefulWidget {
  @override
  _SendsmsState createState() => new _SendsmsState();
}

class _SendsmsState extends State<Sendsms> {
  String body;
  List<String> people = [];

  void _sendSMS(String message, List<String> recipents) async {
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents);
    // _sendSMS("Please Help I am in Danger", ['5566543454', "26589477788"]);

    setState(() {
      Navigator.pop(context);
    });
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
        print(position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      });
    }

    getlocation();
    _sendSMS('Please Help !!!', ['7425833402']);

    // ignore: unnecessary_parenthesis
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text('FIN'),
      ),
    ));
  }
}
