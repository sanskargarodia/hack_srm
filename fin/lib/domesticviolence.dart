import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fin/auth.dart';

import 'globals.dart' as globals;

class Domesticviolence extends StatefulWidget {
  @override
  _DomesticviolenceState createState() => _DomesticviolenceState();
}

class _DomesticviolenceState extends State<Domesticviolence> {
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
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Friend In Need'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('laws').snapshots(),
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
                children: snapshot.data.documents.map((document) {
                  return Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              document['name'].toString(),
                              textAlign: TextAlign.left,
                            ),
                            subtitle: Text(document['description'].toString()),
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
                          ),
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      ));
                }).toList(),
              ),
            );
          }),
    ));
  }
}
