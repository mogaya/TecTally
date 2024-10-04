import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/asset_categories_controllers/search_emp_controller.dart';
import 'package:tectally_app/models/employee_model.dart';
import 'package:tectally_app/views/components/customText.dart';

// searchEmpController searchEmpController = Get.put(searchEmpController());
SearchEmpController searchEmpController = Get.put(SearchEmpController());

class SearchEmp extends StatefulWidget {
  const SearchEmp({super.key});

  @override
  State<SearchEmp> createState() => _BoardState();
}

class _BoardState extends State<SearchEmp> {
  final SearchController _searchController = SearchController();
  bool showNoData = false;

  @override
  void initState() {
    super.initState();
    getEmployees();

    Timer(
      const Duration(seconds: 6),
      () {
        if (searchEmpController.searchEmpList.isEmpty) {
          setState(() {
            showNoData = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // getEmployees();
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Search Employee",
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
          if (searchEmpController.searchEmpList.isEmpty) {
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
                          searchEmpController.filterSearchEmps(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () {
                      if (searchEmpController.filteredSearchEmpList.isEmpty) {
                        return Center(
                          child: Lottie.network(
                              'https://lottie.host/730a99d0-773b-43d9-8802-81ab339f51a4/JUTQ5PziHR.json'),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            searchEmpController.filteredSearchEmpList.length,
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
                                        // setSelectedEmp(context, index);
                                        searchEmpController.updateSelectedEmp(
                                            searchEmpController
                                                .filteredSearchEmpList[index]
                                                .emp_name);
                                        searchEmpController
                                            .updateSelectedDepartment(
                                                searchEmpController
                                                    .filteredSearchEmpList[
                                                        index]
                                                    .emp_dpt);
                                        Get.toNamed('/assign_info');
                                        print(
                                            '${searchEmpController.selectedEmp.value}');
                                      },
                                      child: customText(
                                        label:
                                            "${searchEmpController.filteredSearchEmpList[index].emp_name}",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    customText(
                                      label:
                                          "Phone: ${searchEmpController.filteredSearchEmpList[index].emp_phone}",
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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

  // Connecting to API to Pull Employees
  Future<void> getEmployees() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://mmogaya.com/tectally/add_asset/search_emp.php"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var employeeResponse = serverResponse['employees'] as List;
      var employeeList = employeeResponse
          .map((employees) => EmployeeModel.fromJson(employees))
          .toList();
      searchEmpController.updateSearchEmpList(employeeList);
    } else {
      print("Error Occurred");
    }
  }
}
