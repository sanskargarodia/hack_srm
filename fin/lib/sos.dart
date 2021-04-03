import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';

class Sos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#A06CD9'),
        title: Text('Friend In Need'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Transform.scale(
                    scale: 4,
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sendsms');
                      },
                      elevation: 2.0,
                      fillColor: HexColor("#ff1919"),
                      child: Text(
                        'SOS',
                        style: (TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ))),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 100),
              child: SizedBox(
                width: 350,
                height: 60,
                child: FloatingActionButton(
                  heroTag: '1',
                  backgroundColor: HexColor('#A06CD9'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  focusColor: Colors.white,
                  child: Text(
                    'Police',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 350,
                height: 60,
                child: FloatingActionButton(
                  heroTag: '2',
                  backgroundColor: HexColor('#A06CD9'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  focusColor: Colors.white,
                  child: Text(
                    'Ambulance',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 350,
                height: 60,
                child: FloatingActionButton(
                  heroTag: '3',
                  backgroundColor: HexColor('#A06CD9'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  focusColor: Colors.white,
                  child: Text(
                    'Close Contacts',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 350,
                height: 60,
                child: FloatingActionButton(
                  heroTag: '4',
                  backgroundColor: HexColor('#A06CD9'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  focusColor: Colors.white,
                  child: Text(
                    'NGO',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
