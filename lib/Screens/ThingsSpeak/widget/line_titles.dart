import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
/*            switch (value.toInt()) {
              case 2:
                return '12:25';
              case 5:
                return '12:26';
              case 8:
                return '12:37';
              case 10:
                return '12:50';
              case 12:
                return '13:10';
              case 14:
                return '13:15';
              case 16:
                return '13:05';
              case 18:
                return '13:20';
              case 20:
                return '13:22';
              case 22:
                return '13:23';
              case 24:
                return '13:27';
              case 26:
                return '13:30';
            }*/
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
/*            switch (value.toInt()) {
              case 1:
                return '0.32';
              case 3:
                return '0.32';
              case 5:
                return '0.65';
              case 7:
                return '1.61';
              case 9:
                return '1.62';
              case 11:
                return '1.94';
              case 13:
                return '0.65';
              case 15:
                return '0.32';
              case 17:
                return '0.95';
              case 19:
                return '1.94';
              case 21:
                return '2';
              case 23:
                return '1.61';
              case 25:
                return '0.32';
              case 27:
                return '0.32';
              case 29:
                return '0.65';
            }
            return '';*/
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
