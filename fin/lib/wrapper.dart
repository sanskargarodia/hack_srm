import 'package:flutter/material.dart';
import 'package:fin/authenticate.dart';
import 'package:fin/home.dart';
import 'package:fin/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    final User user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
