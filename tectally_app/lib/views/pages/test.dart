import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/indicator.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<Test> {
  int touchedIndex1 = -1;
  int touchedIndex2 = -1;
  int touchedIndex3 = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildPieChart(
            touchedIndex1,
            (index) => setState(() => touchedIndex1 = index),
            showingSections1(),
          ),
          SizedBox(height: 10), // spacing between pie charts
          buildPieChart(
            touchedIndex2,
            (index) => setState(() => touchedIndex2 = index),
            showingSections2(),
          ),
          SizedBox(height: 10), // spacing between pie charts
          buildPieChart(
            touchedIndex3,
            (index) => setState(() => touchedIndex3 = index),
            showingSections3(),
          ),
        ],
      ),
    );
  }

  Widget buildPieChart(int touchedIndex, Function(int) onTouch,
      List<PieChartSectionData> sections) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        onTouch(-1);
                        return;
                      }
                      onTouch(
                          pieTouchResponse.touchedSection!.touchedSectionIndex);
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: sections,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Colors.blue,
                text: 'First',
                isSquare: true,
              ),
              const SizedBox(height: 4),
              Indicator(
                color: Colors.yellow,
                text: 'Second',
                isSquare: true,
              ),
              const SizedBox(height: 4),
              Indicator(
                color: Colors.purple,
                text: 'Third',
                isSquare: true,
              ),
              const SizedBox(height: 4),
              Indicator(
                color: Colors.green,
                text: 'Fourth',
                isSquare: true,
              ),
              const SizedBox(height: 18),
            ],
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections1() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex1;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  // Define similar methods for the other two pie charts

  List<PieChartSectionData> showingSections2() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex2;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: 35,
            title: '35%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.teal,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.brown,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections3() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex3;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.cyan,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.lime,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.indigo,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.pink,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
