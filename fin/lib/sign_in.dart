import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fin/auth.dart';
import 'package:hexcolor/hexcolor.dart';

import 'globals.dart' as globals;

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 9,
                    MediaQuery.of(context).size.width / 6,
                    0,
                    0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 40),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 9,
                    MediaQuery.of(context).size.width / 9,
                    0,
                    0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width / 27,
                    horizontal: MediaQuery.of(context).size.width / 9),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (String val) =>
                            val.isEmpty ? 'Enter a valid email' : null,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(20, 20)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                        ),
                        onChanged: (String val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.width / 9,
                              0,
                              MediaQuery.of(context).size.width / 27),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (String val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(20, 20)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                        ),
                        obscureText: true,
                        onChanged: (String val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 8,
                        child: RaisedButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 10))),
                          color: HexColor('#A06CD9'),
                          child: const FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Log in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              final dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Please Enter a Valid Email';
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 24,
                      ),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(10, 10))),
                            color: Colors.blue[900],
                            child: const FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
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
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(10, 10))),
                              color: Colors.blue[900],
                              child: const FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  'Guest Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
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
                ))
          ],
        ),
      ),
    );
  }
}
