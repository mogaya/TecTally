import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/indicator.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<Statistics> {
  int touchedIndex1 = -1;
  int touchedIndex2 = -1;
  int touchedIndex3 = -1;
  int touchedIndex4 = -1;
  int touchedIndex5 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const customText(
          label: "Statistics",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPieChart(
                touchedIndex1,
                (index) => setState(() => touchedIndex1 = index),
                totalAssets(),
                buildIndicators([
                  {'color': Colors.blue, 'text': 'Assets 250'},
                ]),
                'Total Assets',
              ),
              const SizedBox(
                height: 10,
              ),
              buildPieChart(
                touchedIndex2,
                (index) => setState(() => touchedIndex2 = index),
                assetStatus(),
                buildIndicators([
                  {'color': Colors.green, 'text': 'Working 210'},
                  {'color': Colors.red, 'text': 'Faulty 40'},
                ]),
                'Asset Status',
              ),
              const SizedBox(
                height: 10,
              ),
              buildPieChart(
                touchedIndex3,
                (index) => setState(() => touchedIndex3 = index),
                allocation(),
                buildIndicators([
                  {'color': Colors.blue, 'text': 'Allocated 200'},
                  {'color': Colors.orange, 'text': 'Waiting 50'},
                ]),
                'Allocation',
              ),
              buildPieChart(
                touchedIndex4,
                (index) => setState(() => touchedIndex4 = index),
                licences(),
                buildIndicators([
                  {'color': Colors.pink, 'text': 'Allocated 200'},
                  {'color': Colors.amber, 'text': 'Waiting 50'},
                ]),
                'Licenses',
              ),
              buildPieChart(
                touchedIndex5,
                (index) => setState(() => touchedIndex5 = index),
                expenses(),
                buildIndicators([
                  {'color': Colors.purple, 'text': 'Allocated 200'},
                  {'color': Colors.teal, 'text': 'Waiting 50'},
                ]),
                'Expenses',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPieChart(
      int touchedIndex,
      Function(int) onTouch,
      List<PieChartSectionData> sections,
      List<Widget> indicators,
      String title) {
    return AspectRatio(
      aspectRatio: 1.62,
      child: Row(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.5,
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
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...indicators,
              const SizedBox(height: 18),
            ],
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }

// Indicators
  List<Widget> buildIndicators(List<Map<String, dynamic>> indicatorData) {
    return indicatorData.map((data) {
      return Column(
        children: [
          Indicator(
            color: data['color'],
            text: data['text'],
            isSquare: true,
          ),
          const SizedBox(height: 4),
        ],
      );
    }).toList();
  }

// Assets Chart data
  List<PieChartSectionData> totalAssets() {
    return List.generate(1, (i) {
      final isTouched = i == touchedIndex1;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      return PieChartSectionData(
        color: Colors.blue,
        value: 40,
        title: "100%",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      );
    });
  }

// Asset Status Data
  List<PieChartSectionData> assetStatus() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex2;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: 35,
            title: '35%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );

        default:
          throw Error();
      }
    });
  }

// Allocation Data
  List<PieChartSectionData> allocation() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex3;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );

        default:
          throw Error();
      }
    });
  }

  // Allocation Data
  List<PieChartSectionData> licences() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex4;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.pink,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );

        default:
          throw Error();
      }
    });
  }

  // Allocation Data
  List<PieChartSectionData> expenses() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex5;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.purple,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.teal,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}
