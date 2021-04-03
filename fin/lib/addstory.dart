import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStory extends StatelessWidget {
  String name;
  String description;
  final _formkey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: RichText(
                      text: TextSpan(
                        text: 'Add Story',
                        style: TextStyle(fontSize: 50),
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
                    height: 250,
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
                                  hintText: "Your Name",
                                  hintStyle: TextStyle(color: Colors.grey)),
                              validator: (String val) =>
                                  val.length < 1 ? 'Please Enter a Name' : null,
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
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2)),
                                hintText: "Description",
                              ),
                              validator: (String val) => val.length < 2
                                  ? 'Adding Story will help others as well'
                                  : null,
                              onChanged: (String val) {
                                description = val;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Add Story',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                Firestore.instance.collection('stories').add(
                                    {'name': name, 'description': description});
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
            )));
  }
}
