import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fin/splashscreen.dart';
import 'package:fin/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_actions/quick_actions.dart';

class Splashpage extends StatefulWidget {
  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  final QuickActions _quickActions = QuickActions();

  @override
  void initState() {
    super.initState();
    _quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
          type: 'page1',
          localizedTitle: 'SOS Button',
          icon: 'ic_category_black_24',
        ),
        const ShortcutItem(
          type: 'page2',
          localizedTitle: 'Ngo',
          icon: 'ic_trending_black_24',
        ),
        const ShortcutItem(
          type: 'page3',
          localizedTitle: 'Information',
          icon: 'ic_category_black_24',
        ),
        const ShortcutItem(
          type: 'page4',
          localizedTitle: 'Location',
          icon: 'ic_category_black_24',
        ),
      ],
    );

    _quickActions.initialize((String shortcut) {
      print(shortcut);
      if (shortcut != null) {
        if (shortcut == 'page1') {
          Navigator.pushNamed(context, "/sendsms");
        }
        if (shortcut == 'page2') {
          Navigator.pushNamed(context, "/ngo");
        }
        if (shortcut == 'page3') {
          Navigator.pushNamed(context, "/information");
        }
        if (shortcut == 'page4') {
          Navigator.pushNamed(context, "/location");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      splash: SplashScreen(),
      splashIconSize: 200,
      nextScreen: Wrapper(),
      duration: 1000,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
