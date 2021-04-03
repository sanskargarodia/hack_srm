import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class Ngo extends StatefulWidget {
  @override
  _NgoState createState() => _NgoState();
}

class _NgoState extends State<Ngo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Friend In Need'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('ngo').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
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
                          subtitle: Text(document['address'].toString()),
                          trailing: FlatButton.icon(
                            onPressed: () {
                              globals.descriptions =
                                  document['description'].toString();
                              Navigator.pushNamed(context, '/descriptions');
                            },
                            icon: Icon(Icons.forward),
                            label: Text(''),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ));
              }).toList(),
            );
          }),
    ));
  }
}
