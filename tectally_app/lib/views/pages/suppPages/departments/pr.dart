import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/departments/pr_controller.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/models/employee_model.dart';
import 'package:tectally_app/views/components/customText.dart';

PrController prController = Get.put(PrController());
ProfileController profileController = Get.put(ProfileController());

class Pr extends StatefulWidget {
  const Pr({super.key});

  @override
  State<Pr> createState() => _PrState();
}

class _PrState extends State<Pr> {
  final SearchController _searchController = SearchController();
  bool showNoData = false;

  @override
  void initState() {
    super.initState();
    getPr();

    Timer(
      const Duration(seconds: 6),
      () {
        if (prController.prList.isEmpty) {
          setState(() {
            showNoData = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // getPr();
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Pr Employees",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Obx(
        () {
          if (showNoData) {
            return Center(
              child: Lottie.network(
                  'https://lottie.host/730a99d0-773b-43d9-8802-81ab339f51a4/JUTQ5PziHR.json'),
            );
          }

          if (prController.prList.isEmpty) {
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
                          prController.filterPr(
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
                  () {
                    if (prController.filteredPrList.isEmpty) {
                      return Center(
                        child: Lottie.network(
                            'https://lottie.host/730a99d0-773b-43d9-8802-81ab339f51a4/JUTQ5PziHR.json'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: prController.filteredPrList.length,
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
                                          "${prController.filteredPrList[index].emp_name}",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  customText(
                                    label:
                                        "Phone: ${prController.filteredPrList[index].emp_phone}",
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),

                                                  // Yes Button
                                                  GestureDetector(
                                                    onTap: () {
                                                      deleteEmployee(
                                                        prController
                                                            .filteredPrList[
                                                                index]
                                                            .emp_id,
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                    child: const customText(
                                                      label: "Yes",
                                                      labelColor: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Show Pr Employee Details
  Future<dynamic> showAssetDetails(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: customText(
              label: "${prController.filteredPrList[index].emp_name}",
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
                        label: "${prController.filteredPrList[index].emp_id}",
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
                        label: "${prController.filteredPrList[index].emp_dpt}",
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
                        label: "${prController.filteredPrList[index].emp_role}",
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
                            "${prController.filteredPrList[index].emp_email}",
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
                            "${prController.filteredPrList[index].emp_phone}",
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

  // Connecting to API to Pull Pr
  Future<void> getPr() async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          "https://mmogaya.com/tectally/departments/pr.php?user_id=${profileController.userId.value}"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var prResponse = serverResponse['pr'] as List;
      var prList = prResponse.map((pr) => EmployeeModel.fromJson(pr)).toList();
      prController.updatePrList(prList);
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
      getPr();
    } else {
      print("Error Ocurred");
    }
  }
}
