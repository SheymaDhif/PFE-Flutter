import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'models/learning.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createPurchaseData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 15,
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            showLeaderLines: false,
            outsideLabelStyleSpec: new charts.TextStyleSpec(fontSize: 18),
            insideLabelStyleSpec: new charts.TextStyleSpec(fontSize: 18),
            labelPosition: charts.ArcLabelPosition.outside,
          )
        ],
      ),
      behaviors: [
        new charts.ChartTitle(
          "Donut Chart tutorial",
          subTitle: "Major fucntionality explained",
          titleOutsideJustification: charts.OutsideJustification.start,
          behaviorPosition: charts.BehaviorPosition.top,
          innerPadding: 24,
        ),
        new charts.DatumLegend(
          position: charts.BehaviorPosition.bottom,
          outsideJustification: charts.OutsideJustification.middleDrawArea,
          horizontalFirst: false,
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          showMeasures: true,
          desiredMaxColumns: 2,
          desiredMaxRows: 2,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          measureFormatter: (num value) {
            return value == null ? '-' : "$value\%";
          },
          entryTextStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.black,
              fontFamily: 'Roboto',
              fontSize: 16),
        ),
        new charts.InitialSelection(selectedDataConfig: [
          new charts.SeriesDatumConfig<String>('Purchases', 'Eating Out'),
        ]),
        new charts.DomainHighlighter(),
      ],
      selectionModels: [
        new charts.SelectionModelConfig(changedListener: (selectionModel) {
          final selectedData = selectionModel.selectedDatum;

          if (selectedData.isNotEmpty) {
            final purchases = selectedData.first.datum.amount;
            print(purchases);
          }
        }),
      ],
    );
  }

  static List<charts.Series<Learning, String>> _createPurchaseData() {
    final data = [
   /*   new Learning("Attention", 73 ,  charts.Color(r: 255, g: 89, b: 100)),
      new Learning("Focus", 75, charts.Color(r: 89, g: 255, b: 89)),
      new Learning("Short Term Memory", 25, charts.Color(r: 89, g: 216, b: 255)),
      new Learning("Long Term Memory", 5, charts.Color(r: 255, g: 166, b: 89)),*/
    ];

    return [
      new charts.Series<Learning, String>(
        id: 'Learning',
        domainFn: (Learning learning, _) => learning.category,
        measureFn: (Learning learning, _) => learning.value,
        data: data,
        colorFn: (Learning learning, _) => learning.color,
        labelAccessorFn: (Learning learning, _) => '${learning.value}\%',
      )
    ];
  }
}
