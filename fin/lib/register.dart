import 'package:flutter/material.dart';
import 'package:fin/auth.dart';

import 'globals.dart' as globals;

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 9,
                MediaQuery.of(context).size.width / 6, 0, 0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Sign Up in FIN',
                style: TextStyle(
                    fontSize: 40, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 9,
            ),
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width / 27,
                horizontal: MediaQuery.of(context).size.width / 9),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (String val) =>
                        val.isEmpty ? 'Enter a Name' : null,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    obscureText: true,
                    onChanged: (String val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  TextFormField(
                    validator: (String val) =>
                        val.isEmpty ? 'Enter a valid email' : null,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(20, 20)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    onChanged: (String val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  TextFormField(
                    validator: (String val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    obscureText: true,
                    onChanged: (String val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 8,
                    child: RaisedButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                      color: Theme.of(context).primaryColor,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  name, email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
                            });
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  Row(children: <Widget>[
                    Container(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 8,
                      child: RaisedButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                        color: Colors.blue[900],
                        child: const FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 9),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 8,
                        child: RaisedButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 10))),
                          color: Colors.blue[900],
                          child: const FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Guest Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          onPressed: () {
                            globals.user_id = 'default';
                            globals.email = '';
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    )
                  ])
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
