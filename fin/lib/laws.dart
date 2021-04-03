import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fin/auth.dart';

import 'globals.dart' as globals;

class Laws extends StatefulWidget {
  @override
  _LawsState createState() => _LawsState();
}

class _LawsState extends State<Laws> {
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
                  return Column(
                    children: <Widget>[
                      ListTile(
                        selected: false,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        title: Text(
                          document['name'].toString(),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              wordSpacing: 1,
                              letterSpacing: 0,
                              fontSize: 25,
                              color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(
                          document['description'].toString(),
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        trailing: FlatButton.icon(
                          onPressed: () {
                            globals.descriptions =
                                document['description'].toString();
                            Navigator.pushNamed(context, '/descriptions');
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          label: Text(''),
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
