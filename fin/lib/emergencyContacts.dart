import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class EmergencyContacts extends StatelessWidget {
  String name;
  String phoneNo;
  final _formkey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white10,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: RichText(
                        text: TextSpan(
                          text: ' Add Emergency \n       Contacts',
                          style: TextStyle(
                              fontSize: 50,
                              color: Theme.of(context).primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: '',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ''),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    Form(
                      key: _formkey,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(20, 20)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                validator: (String val) => val.length < 1
                                    ? 'Please Enter a Name'
                                    : null,
                                onChanged: (String val) {
                                  name = val;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(20, 20)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    hintText: "Phone No",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                validator: (String val) => val.length < 2
                                    ? 'Adding Story will help others as well'
                                    : null,
                                onChanged: (String val) {
                                  phoneNo = val;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'Add Number',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  Firestore.instance
                                      .collection("users")
                                      .add({'name': name, 'phoneNo': phoneNo});
                                  Navigator.pop(context);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
