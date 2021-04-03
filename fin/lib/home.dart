import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fin/auth.dart';
import 'package:hexcolor/hexcolor.dart';

import 'globals.dart' as globals;

class HomeButton {
  final String title;
  IconData iconData;
  final String navigate;

  final AssetImage imageData;
  HomeButton({this.title, this.navigate, this.iconData, this.imageData});
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primarycolor = Theme.of(context).primaryColor;
    List<HomeButton> homebutton = [
      HomeButton(
          title: "Information",
          navigate: "information",
          iconData: Icons.info_outline,
          imageData: AssetImage("assets/images/Information.jpeg")),
      HomeButton(
          title: "Stories",
          navigate: "stories",
          iconData: Icons.chat,
          imageData: AssetImage("assets/images/Stories.jpeg")),
      HomeButton(
          title: "Hotline",
          imageData: AssetImage("assets/images/Location.jpeg")),
      HomeButton(
          title: "Location",
          navigate: "locations",
          iconData: Icons.location_on,
          imageData: AssetImage("assets/images/Location.jpeg")),
      HomeButton(
          title: "NGO",
          navigate: "ngo",
          iconData: Icons.people,
          imageData: AssetImage("assets/images/NGO.jpeg"))
    ];

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: StreamBuilder(
                  stream: Firestore.instance
                      .collection('user_details')
                      .document(globals.user_id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }
                    dynamic userDocument = snapshot.data;
                    globals.output = userDocument['name'] as String;
                    return Container(
                        child: Text(userDocument['name'] as String));
                  },
                ),
                accountEmail: Text(globals.email),
                decoration: BoxDecoration(color: HexColor('#A06CD9')),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.white
                          : Colors.white,
                  child: Text(
                    getInitials(globals.output),
                    style:
                        TextStyle(fontSize: 40.0, color: HexColor('#A06CD9')),
                  ),
                ),
              ),
              ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pushNamed(context, '/aboutus');
                },
              ),
              const ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
              FlatButton.icon(
                  onPressed: () async {
                    if (globals.user_id == 'default') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                    await _auth.signout();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Log out'))
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white10,
          title: Container(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: [
                    Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceAround,
                        spacing: 20,
                        runSpacing: 40,
                        children: <Widget>[
                          for (var homebutton in homebutton)
                            homebutton.title == "Hotline"
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width /
                                                4),
                                    //width: MediaQuery.of(context).size.width,
                                    child: Container(
                                      width: size.width / 2.5,
                                      height: size.height / 6,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.blue,
                                        shape: CircleBorder(),
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              "Hotline",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )
                                : Container(
                                    //margin: EdgeInsets.fromLTRB(0, 80, 20, 20),
                                    //padding: EdgeInsets.only(top: 10),
                                    width: size.width / 2.5,
                                    height: size.height / 6,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Theme.of(context).buttonColor,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 9,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      onPressed: () => {
                                        Navigator.pushNamed(
                                            context, '/${homebutton.navigate}')
                                      },
                                      child: Stack(
                                        // Replace with a Row for horizontal icon + text
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Image(
                                                    image:
                                                        homebutton.imageData)),
                                          ),
                                          FittedBox(
                                            alignment: Alignment.bottomCenter,
                                            fit: BoxFit.cover,
                                            child: Hero(
                                              tag: '${homebutton.title}',
                                              child: Text(
                                                "${homebutton.title}",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                        ]),
                    Container(
                      child: RaisedButton(
                        onPressed: () => {null},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'SOS',
                            style: TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onLongPress: () {
                          Navigator.pushNamed(context, '/sendsms');
                        },
                        padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                        color: HexColor("#ff1919"),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "Long press SOS button to activate distress signal",
                      style: TextStyle(color: HexColor("#ff1919")),
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  String getInitials(String bank_account_name) => bank_account_name.isNotEmpty
      ? bank_account_name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}
