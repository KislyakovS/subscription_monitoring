import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import './components.dart';

class ChartPie extends StatefulWidget {
  ChartPie({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartPieState();
}

class ChartPieState extends State<ChartPie> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  // pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  //   setState(() {
                  //     final desiredTouch =
                  //         pieTouchResponse.touchInput is! PointerExitEvent &&
                  //             pieTouchResponse.touchInput is! PointerUpEvent;
                  //     if (desiredTouch &&
                  //         pieTouchResponse.touchedSection != null) {
                  //       touchedIndex = pieTouchResponse
                  //           .touchedSection!.touchedSectionIndex;
                  //     } else {
                  //       touchedIndex = -1;
                  //     }
                  //   });
                  // }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: 'First',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'Second',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: 'Third',
                isSquare: true,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'Fourth',
                isSquare: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
