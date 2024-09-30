import 'dart:async';
import 'dart:convert';

import 'package:animated_number/animated_number.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/controllers/statistics/asset_tally_controller.dart';
import 'package:tectally_app/controllers/statistics/employee_tally_controller.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/indicator.dart';

AssetTallyController assetTallyController = Get.put(AssetTallyController());
EmployeeTallyController employeeTallyController =
    Get.put(EmployeeTallyController());
ProfileController profileController = Get.put(ProfileController());

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<Statistics> {
  int touchedIndex = -1;
  int touchedIndex1 = -1;
  bool showNoAssetsText = false;

  @override
  void initState() {
    super.initState();
    getStatistics();

    // Set a timeout of 5 seconds to display "No assets" text
    Timer(
      const Duration(seconds: 6),
      () {
        if (assetTallyController.totalAssets.value &
                employeeTallyController.totalEmployees.value ==
            0) {
          setState(() {
            showNoAssetsText = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Statistics",
          fontSize: 28,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () {
          if (showNoAssetsText) {
            return Center(
                child: Column(
              children: [
                Lottie.network(
                    'https://lottie.host/730a99d0-773b-43d9-8802-81ab339f51a4/JUTQ5PziHR.json'),
                const customText(
                  label: 'No Statistics: Add Data',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  labelColor: Colors.red,
                ),
              ],
            ));
          }

          if (assetTallyController.totalAssets.value == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: customText(
                                label: "Assets Tally",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 85,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: AnimatedNumber(
                                      startValue: 0,
                                      endValue: assetTallyController
                                          .totalAssets.value
                                          .toDouble(),
                                      duration: const Duration(seconds: 5),
                                      decimalPoint: 0,
                                      isFloatingPoint: false,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ascentColor,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: customText(
                                label: "Employee Tally",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 85,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: AnimatedNumber(
                                      startValue: 0,
                                      endValue: employeeTallyController
                                          .totalEmployees.value
                                          .toDouble(),
                                      duration: const Duration(seconds: 5),
                                      decimalPoint: 0,
                                      isFloatingPoint: false,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ascentColor,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildPieChart(
                    touchedIndex,
                    (index) => setState(() => touchedIndex = index),
                    assetsTally(),
                    buildIndicators([
                      {
                        'color': Colors.red,
                        'text':
                            'computers: ${assetTallyController.computersTally.value}'
                      },
                      {
                        'color': Colors.green,
                        'text':
                            'mobiles: ${assetTallyController.mobilesTally.value}'
                      },
                      {
                        'color': Colors.orange,
                        'text':
                            'networking: ${assetTallyController.networkingTally.value}'
                      },
                      {
                        'color': Colors.blue,
                        'text':
                            'printers: ${assetTallyController.printersTally.value}'
                      },
                      {
                        'color': Colors.yellow,
                        'text':
                            'peripherals: ${assetTallyController.peripheralsTally.value}'
                      },
                      {
                        'color': Colors.indigo,
                        'text':
                            'storage: ${assetTallyController.storageTally.value}'
                      },
                      {
                        'color': Colors.purple,
                        'text':
                            'otherAssets: ${assetTallyController.othersAssetsTally.value}'
                      },
                    ]),
                    'Asset Categories',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildPieChart(
                    touchedIndex1,
                    (index) => setState(() => touchedIndex1 = index),
                    employeeTally(),
                    buildIndicators([
                      {
                        'color': Colors.red,
                        'text':
                            'board: ${employeeTallyController.boardTally.value}'
                      },
                      {
                        'color': Colors.green,
                        'text': 'pr: ${employeeTallyController.prTally.value}'
                      },
                      {
                        'color': Colors.orange,
                        'text':
                            'finance: ${employeeTallyController.financeTally.value}'
                      },
                      {
                        'color': Colors.blue,
                        'text': 'hr: ${employeeTallyController.hrTally.value}'
                      },
                      {
                        'color': Colors.yellow,
                        'text': 'ict: ${employeeTallyController.ictTally.value}'
                      },
                      {
                        'color': Colors.indigo,
                        'text':
                            'procurement: ${employeeTallyController.procurementTally.value}'
                      },
                      {
                        'color': Colors.purple,
                        'text':
                            'Others: ${employeeTallyController.otherDepartmentsTally.value}'
                      },
                    ]),
                    'Department Tally',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getStatistics() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://mmogaya.com/tectally/statistics.php?user_id=${profileController.userId.value}"),
      );

      if (response.statusCode == 200) {
        final serverResponse = json.decode(response.body);

        // Asset Tally Section
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

        // Employees Tally
        employeeTallyController
            .updateTotalEmployees(int.parse(serverResponse['total_employees']));
        employeeTallyController.updateBoardTally(
            int.parse(serverResponse['employees_by_department']['Board']));
        employeeTallyController.updatePrTally(
            int.parse(serverResponse['employees_by_department']['PR']));
        employeeTallyController.updateFinanceTally(
            int.parse(serverResponse['employees_by_department']['Finance']));
        employeeTallyController.updateHrTally(int.parse(
            serverResponse['employees_by_department']['Human Resource']));
        employeeTallyController.updateIctTally(
            int.parse(serverResponse['employees_by_department']['ICT']));
        employeeTallyController.updateProcurementTally(int.parse(
            serverResponse['employees_by_department']['Procurement']));
        employeeTallyController.updateOtherDepartmentsTally(int.parse(
            serverResponse['employees_by_department']['Other Departments']));

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
                  fontSize: 16,
                  fontFamily: 'OpenSans',
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
        final isTouched = i == touchedIndex;
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

  // Asset Employee Data
  List<PieChartSectionData> employeeTally() {
    // Helper function to calculate percentage
    double calculatePercentage(int assetValue) {
      return assetTallyController.totalAssets.value != 0
          ? (assetValue / assetTallyController.totalAssets.value) * 100
          : 0;
    }

    return List.generate(
      7,
      (i) {
        final isTouched = i == touchedIndex1;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 50.0 : 40.0;

        switch (i) {
          // board
          case 0:
            return PieChartSectionData(
              color: Colors.red,
              value: employeeTallyController.boardTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.boardTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // pr
          case 1:
            return PieChartSectionData(
              color: Colors.green,
              value: employeeTallyController.prTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.prTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // finance
          case 2:
            return PieChartSectionData(
              color: Colors.orange,
              value: employeeTallyController.financeTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.financeTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // hr
          case 3:
            return PieChartSectionData(
              color: Colors.blue,
              value: employeeTallyController.hrTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.hrTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // ict
          case 4:
            return PieChartSectionData(
              color: Colors.yellow,
              value: employeeTallyController.ictTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.ictTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // procurement
          case 5:
            return PieChartSectionData(
              color: Colors.indigo,
              value: employeeTallyController.procurementTally.value.toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.procurementTally.value).toStringAsFixed(0)}%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );

          // OtherDepartments
          case 6:
            return PieChartSectionData(
              color: Colors.purple.shade300,
              value: employeeTallyController.otherDepartmentsTally.value
                  .toDouble(),
              title:
                  '${calculatePercentage(employeeTallyController.otherDepartmentsTally.value).toStringAsFixed(0)}%',
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
