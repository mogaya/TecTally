import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/departments/finance_controller.dart';
import 'package:tectally_app/models/employee_model.dart';
import 'package:tectally_app/views/components/customText.dart';

FinanceController financeController = Get.put(FinanceController());

class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  final SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();
    getFinance();
  }

  @override
  Widget build(BuildContext context) {
    // getFinance();
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Finance Employees",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Obx(
        () {
          if (financeController.financeList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Area
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: _searchController,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          _searchController.openView();
                        },
                        onChanged: (query) {
                          financeController.filterFinance(
                              query); // Filters the computer list based on the query
                          _searchController.openView();
                        },
                        leading: const Icon(Icons.search),
                      );
                    },

                    // Builds a list of suggestions based on user's input
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    },
                  ),
                ),

                // Assets List
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: financeController.filteredFinanceList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showAssetDetails(context, index);
                                  },
                                  child: customText(
                                    label:
                                        "${financeController.filteredFinanceList[index].emp_name}",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                customText(
                                  label:
                                      "Phone: ${financeController.filteredFinanceList[index].emp_phone}",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: const customText(
                                            label:
                                                "Do you want to delete this Employee?",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          actions: [
                                            // Cancel Button
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: const customText(
                                                    label: "Cancel",
                                                    labelColor: Colors.green,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                                // Yes Button
                                                GestureDetector(
                                                  onTap: () {
                                                    deleteEmployee(
                                                      financeController
                                                          .filteredFinanceList[
                                                              index]
                                                          .emp_id,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  child: const customText(
                                                    label: "Yes",
                                                    labelColor: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                              },
                              child: const customText(
                                label: "DELETE",
                                fontWeight: FontWeight.bold,
                                labelColor: Colors.red,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Show Finance Employee Details
  Future<dynamic> showAssetDetails(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: customText(
              label: "${financeController.filteredFinanceList[index].emp_name}",
              fontSize: 24,
              labelColor: secondaryColor,
              // fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            height: 220,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const customText(
                        label: "Employee ID: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${financeController.filteredFinanceList[index].emp_id}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Employee Department: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${financeController.filteredFinanceList[index].emp_dpt}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Employee Role: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${financeController.filteredFinanceList[index].emp_role}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const customText(
                        label: "Employee Email: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${financeController.filteredFinanceList[index].emp_email}",
                        fontSize: 20,
                        labelColor: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Employee Phone: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${financeController.filteredFinanceList[index].emp_phone}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Connecting to API to Pull Finance
  Future<void> getFinance() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://mmogaya.com/tectally/departments/finance.php"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var financeResponse = serverResponse['finance'] as List;
      var financeList = financeResponse
          .map((finance) => EmployeeModel.fromJson(finance))
          .toList();
      financeController.updateFinanceList(financeList);
    } else {
      print("Error Occurred");
    }
  }

  // Delete Asset Logic
  Future<void> deleteEmployee(emp_id) async {
    http.Response response;
    response = await http.get(
      Uri.parse(
        "https://mmogaya.com/tectally/departments/delete_employee.php?emp_id=$emp_id",
      ),
    );
    if (response.statusCode == 200) {
      getFinance();
    } else {
      print("Error Ocurred");
    }
  }
}
