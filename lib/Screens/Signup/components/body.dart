import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/HomeScreen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/network/api_services.dart';
import 'package:flutter_auth/services/auth_service.dart';
import 'package:flutter_auth/utils/utils.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {

  String email;
  String password;
  String name;
  String country;
  String sexe;
  String age;
  bool _hasError = false;
  bool _isLoading = false;
  bool _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedInputField(

              hintText: "Your name",
              onChanged: (value) {
                name = value;
              },
            ),
            RoundedInputField(
              hintText: "Your country",
              onChanged: (value) {
                country = value;
              },
            ),
            RoundedInputField(
              hintText: "Your sexe",
              onChanged: (value) {
                sexe = value;
              },
            ),
            RoundedInputField(
              hintText: "Your age",
              onChanged: (value) {
                age = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                register();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
          ],
        ),
      ),
    );
  }

  bool checkData() {
    return !((email != "" &&
        email.contains("@") &&
        email.contains(".")));
  }

  Future register() async {
    if (checkData()) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    } else {
      var body = {
        "email": email,
        "password": password,
        "name": name,
        "country": country,
        "sexe": sexe,
        "age": age,
      };
      print(body);
      var user = await AccountServices.register(body);
      FocusScope.of(context).unfocus();
      if (user != null) {
        log(user.toString());
        AuthService.setUser(user: user);
        showAlertFromTop(
            context, "YOU ARE SUCCESSUFULLY REGISTRED.", TextMessage);
        /*Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false);*/
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    }
  }
}
