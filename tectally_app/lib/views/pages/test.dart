import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/statistics/asset_tally_controller.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/indicator.dart';

AssetTallyController assetTallyController = Get.put(AssetTallyController());

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<Test> {
  int touchedIndex2 = -1;

  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Test",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                buildPieChart(
                  touchedIndex2,
                  (index) => setState(() => touchedIndex2 = index),
                  assetsTally(),
                  buildIndicators([
                    {
                      'color': Colors.red,
                      'text':
                          'Computers: ${assetTallyController.computersTally.value}'
                    },
                    {
                      'color': Colors.green,
                      'text':
                          'Mobiles: ${assetTallyController.mobilesTally.value}'
                    },
                    {
                      'color': Colors.orange,
                      'text':
                          'Networking: ${assetTallyController.networkingTally.value}'
                    },
                    {
                      'color': Colors.blue,
                      'text':
                          'Printers: ${assetTallyController.printersTally.value}'
                    },
                    {
                      'color': Colors.yellow,
                      'text':
                          'Peripherals: ${assetTallyController.peripheralsTally.value}'
                    },
                    {
                      'color': Colors.indigo,
                      'text':
                          'Storage: ${assetTallyController.storageTally.value}'
                    },
                    {
                      'color': Colors.purple,
                      'text':
                          'OtherAssets: ${assetTallyController.othersAssetsTally.value}'
                    },
                  ]),
                  'Asset Categories',
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getStatistics() async {
    try {
      final response = await http
          .get(Uri.parse("https://mmogaya.com/tectally/statistics.php"));

      if (response.statusCode == 200) {
        final serverResponse = json.decode(response.body);

        assetTallyController
            .updateTotalAssets(int.parse(serverResponse['total_assets']));
        assetTallyController.updateComputers(
            int.parse(serverResponse['assets_by_category']['Computer']));
        assetTallyController.updateMobiles(
            int.parse(serverResponse['assets_by_category']['Mobile']));
        assetTallyController.updateNetworking(
            int.parse(serverResponse['assets_by_category']['Networking']));
        assetTallyController.updatePrinters(
            int.parse(serverResponse['assets_by_category']['Printer']));
        assetTallyController.updatePeripherals(
            int.parse(serverResponse['assets_by_category']['Peripheral']));
        assetTallyController.updateStorage(
            int.parse(serverResponse['assets_by_category']['Storage']));
        assetTallyController.updateOtherAssets(
            int.parse(serverResponse['assets_by_category']['Others']));

        print("Total Assets: ${assetTallyController.totalAssets.value}");
      } else {
        print("Error Occurred: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
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

  // Asset Status Data
  List<PieChartSectionData> assetsTally() {
    // Helper function to calculate percentage
    double calculatePercentage(int assetValue) {
      return assetTallyController.totalAssets.value != 0
          ? (assetValue / assetTallyController.totalAssets.value) * 100
          : 0;
    }

    return List.generate(
      7,
      (i) {
        final isTouched = i == touchedIndex2;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 50.0 : 40.0;

        switch (i) {
          // Computers
          case 0:
            return PieChartSectionData(
              color: Colors.red,
              value: assetTallyController.computersTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.computersTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // Mobiles
          case 1:
            return PieChartSectionData(
              color: Colors.green,
              value: assetTallyController.mobilesTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.mobilesTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // Networking
          case 2:
            return PieChartSectionData(
              color: Colors.orange,
              value: assetTallyController.networkingTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.networkingTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // Printers
          case 3:
            return PieChartSectionData(
              color: Colors.blue,
              value: assetTallyController.printersTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.printersTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // Peripherals
          case 4:
            return PieChartSectionData(
              color: Colors.yellow,
              value: assetTallyController.peripheralsTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.peripheralsTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // Storage
          case 5:
            return PieChartSectionData(
              color: Colors.indigo,
              value: assetTallyController.storageTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.storageTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // OtherAssets
          case 6:
            return PieChartSectionData(
              color: Colors.purple.shade300,
              value: assetTallyController.othersAssetsTally.value.toDouble(),
              title:
                  '${calculatePercentage(assetTallyController.othersAssetsTally.value).toStringAsFixed(0)}%',
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
      },
    );
  }
}
