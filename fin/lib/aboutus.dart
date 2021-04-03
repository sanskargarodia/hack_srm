import 'package:flutter/material.dart';

class Aboutsection {
  final String title;
  final String data;
  IconData iconData;

  Aboutsection({this.title, this.data, this.iconData});
}

class Aboutus extends StatelessWidget {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Aboutsection> aboutsection = [
      Aboutsection(
          title: "Contact Us", data: "", iconData: Icons.contact_phone),
      Aboutsection(
          title: "Terms And Condition", data: "", iconData: Icons.lock_outline),
      Aboutsection(title: "App Info", data: "", iconData: Icons.info_outline)
    ];
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(fit: BoxFit.cover, child: Text('About Us')),
        ),
        body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (var aboutsection in aboutsection)
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 4,
                      child: Icon(
                        aboutsection.iconData,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width / 3,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    Card(
                      child: ListTile(
                        title: Center(
                          child: Text(
                            '${aboutsection.title}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
