import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fin/auth.dart';

import 'globals.dart' as globals;

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String name;
  String description;
  String error;
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white10,
          title: Text(
            'Back to Home',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/addstory');
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: Text(''))
          ]),
      body: StreamBuilder(
          stream: Firestore.instance.collection('stories').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Card(
              shadowColor: Colors.grey,
              elevation: 10,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListView(
                itemExtent: 100,
                children: snapshot.data.documents.map((document) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            document['name'] as String,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        trailing: FlatButton.icon(
                          onPressed: () {
                            globals.descriptions =
                                document['description'].toString();
                            Navigator.pushNamed(context, '/descriptions');
                          },
                          icon: Icon(
                            Icons.more_horiz,
                          ),
                          label: Text('more'),
                        ),
                        onTap: () {
                          globals.descriptions =
                              document['description'].toString();
                          Navigator.pushNamed(context, '/descriptions');
                        },
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          }),
    ));
  }
}
