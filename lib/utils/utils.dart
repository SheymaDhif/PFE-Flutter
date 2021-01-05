


import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

showAlertFromTop(BuildContext context, String text, Color color) {
  Flushbar(
    flushbarStyle: FlushbarStyle.GROUNDED,
    flushbarPosition: FlushbarPosition.TOP,
    messageText: Text(
      text,
      style: TextStyle(
          fontFamily: 'GoogleSansMedium', fontSize: 14, color: Colors.white),
    ),
    backgroundColor: color,
    duration: Duration(seconds: 3),
  )..show(context);
}