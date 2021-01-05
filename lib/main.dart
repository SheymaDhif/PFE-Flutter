import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/onboarding/on_boarding_screen.dart';
import 'services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: FutureBuilder(
          future: AuthService.checkIfFirstTime(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.hasData && snapshot.data != null
                  ? checkIfFirstTime(snapshot.data)
                  : checkIfFirstTime(null);
            } else {
              return Container(
                width: 100,
                height: 30,
                color: Colors.white,
                child: Text(
                  "Something went wrong !!, try deleting the app then reinstall it again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: KprimaryTextColor.withOpacity(0.3),
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget checkIfFirstTime(bool isFirstTime) {
    if (isFirstTime != null) {
      return WelcomeScreen();
    } else {
      return OnBoardingScreen();
    }
  }
}

