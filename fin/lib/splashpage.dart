import 'package:flutter/material.dart';

class Splashpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Image(
          image: AssetImage("assets/images/logo.jpeg"),
        ),
      ),
    );
  }
}
