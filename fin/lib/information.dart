import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Info {
  final String title;
  final String navigate;
  final double height;
  Info({this.title, this.navigate, this.height});
}

class Information extends StatelessWidget {
  List<Info> info = [
    Info(title: "Faq's", navigate: "faq", height: 0.1),
    Info(title: "Laws", navigate: "laws", height: 0.2),
    Info(title: "Police", navigate: "police", height: 0.3),
    Info(title: "Ambulance", navigate: "ambulance", height: 0.4)
  ];
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primarycolor = Theme.of(context).primaryColor;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            title: Container(
              padding: EdgeInsets.only(top: 10),
              child: Hero(
                tag: "Information",
                child: Text(
                  'Information',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          body: Stack(children: [
            Container(
              width: size.width,
              height: size.height / 2.3,
              decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(400),
                      bottomRight: Radius.circular(400))),
            ),
            Container(
                child: ListView(children: <Widget>[
              Stack(children: [
                for (Info info in info)
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * info.height),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color:
                                  Theme.of(context).primaryColor.withOpacity(1),
                              blurRadius: 9,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Card(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                            focusColor: Colors.black,
                            child: Text(
                              '${info.title}',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            onPressed: () {
                              Navigator.pushNamed(context, '/${info.navigate}');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
            ])),
          ])),
    );
  }
}
