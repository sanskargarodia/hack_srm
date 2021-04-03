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
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white10,
          title: Container(
            padding: EdgeInsets.only(top: 10),
            child: Hero(
              tag: "",
              child: Text(
                'Information',
                style: TextStyle(
                    fontSize: 40, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        body: Container(
            child: ListView(children: <Widget>[
          Column(children: [
            SizedBox(
              height: 20,
            ),
            for (Info info in info)
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: SizedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 9,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
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
      ),
    );
  }
}
