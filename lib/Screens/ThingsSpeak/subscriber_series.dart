import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class SubscriberSeries {
  final String sec;
  final int frequency;
  final charts.Color barColor;

  SubscriberSeries(
      {@required this.sec,
        @required this.frequency,
        @required this.barColor});
}