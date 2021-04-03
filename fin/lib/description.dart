import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class Descriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white10,
        elevation: 0,
        title: Text(
          '',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1,
            maxHeight: MediaQuery.of(context).size.height / 1.2),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(children: <Widget>[
              Container(
                child: Text(
                  globals.descriptions,
                  style: TextStyle(fontSize: 15, fontFamily: "Times New Roman"),
                ),
              ),
              Divider(
                color: Colors.yellow[600],
                thickness: 2,
              ),
              Container(
                  child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contact Us:"),
              ))
            ]),
          ),
        ),
      ),
    ));
  }
}
