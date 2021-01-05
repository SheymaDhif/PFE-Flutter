import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ThingsSpeak/page/line_chart_page.dart';
import 'package:flutter_auth/models/beta_entity.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter_auth/generated/json/base/json_convert_content.dart';
import 'package:flutter_auth/generated/json/base/json_field.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'chart_util.dart';
import 'package:flutter_auth/constants.dart';



class WaveScreen extends StatefulWidget {
  WaveScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WaveScreenState createState() => _WaveScreenState();
}

class _WaveScreenState extends State<WaveScreen> {
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("see your waves"), centerTitle: true, backgroundColor: kPrimaryColor),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: PageView(
        children: [
          LineChartPage(),
        ],
      ),
    ),
  );}