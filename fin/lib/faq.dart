import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Friend In Need'),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('faq').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading');
              }
              return ListView(
                  children: snapshot.data.documents.map((document) {
                return ExpansionTile(
                  title: Text(document['question'] as String),
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(document['answer'] as String))
                  ],
                );
              }).toList());
            }),
      ),
    );
  }
}
