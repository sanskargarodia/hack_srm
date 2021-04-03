import 'package:flutter/material.dart';
import 'package:fin/aboutus.dart';
import 'package:fin/addstory.dart';
import 'package:fin/auth.dart';
import 'package:fin/description.dart';
import 'package:fin/domesticviolence.dart';
import 'package:fin/emergencyContacts.dart';
import 'package:fin/faq.dart';
import 'package:fin/home.dart';
import 'package:fin/information.dart';
import 'package:fin/laws.dart';
import 'package:fin/location.dart';
import 'package:fin/locations.dart';
import 'package:fin/ngo.dart';
import 'package:fin/profile.dart';
import 'package:fin/sendsms.dart';
import 'package:fin/sos.dart';
import 'package:fin/splashpage.dart';
import 'package:fin/stories.dart';
import 'package:fin/user.dart';
import 'package:fin/wrapper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splashpage(),
          // Start the app with the "/" named route. In this case, the app starts
          // on the FirstScreen widget.
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/ngo': (context) => Ngo(),
            '/information': (context) => Information(),
            '/stories': (context) => Stories(),
            '/location': (context) => Locations(),
            '/sos': (context) => Sos(),
            '/locations': (context) => MapPage(),
            '/sendsms': (context) => Sendsms(),
            '/home': (context) => Home(),
            '/descriptions': (context) => Descriptions(),
            '/faq': (context) => Faq(),
            '/addstory': (context) => AddStory(),
            '/aboutus': (context) => Aboutus(),
            '/emergencycontacts': (context) => EmergencyContacts(),
            '/profiles': (context) => Profile(),
            '/laws': (context) => Laws(),
            '/domesticviolence': (context) => Domesticviolence(),
          },
          theme: ThemeData(
            primaryColor: HexColor("#A06CD9"),
            buttonColor: HexColor("#A06CD9"),
          ),
        ));
  }
}
