import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/asset_categories_controllers/computer_controller.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/models/asset_model.dart';
import 'package:tectally_app/views/components/customText.dart';

ComputerController computerController = Get.put(ComputerController());
ProfileController profileController = Get.put(ProfileController());

class Computers extends StatefulWidget {
  const Computers({super.key});

  @override
  State<Computers> createState() => _ComputersState();
}

class _ComputersState extends State<Computers> {
  final SearchController _searchController = SearchController();
  bool showNoData = false;

  @override
  void initState() {
    super.initState();
    getComputers();

    Timer(
      const Duration(seconds: 6),
      () {
        if (computerController.computerList.isEmpty) {
          setState(
            () {
              showNoData = true;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // getComputers();
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Computers",
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

          if (computerController.computerList.isEmpty) {
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
                          computerController.filterComputers(
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
                    if (computerController.filteredComputerList.isEmpty) {
                      return Center(
                        child: Lottie.network(
                            'https://lottie.host/730a99d0-773b-43d9-8802-81ab339f51a4/JUTQ5PziHR.json'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: computerController.filteredComputerList.length,
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
                                          "${computerController.filteredComputerList[index].ast_name}",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  customText(
                                    label:
                                        "Tag No. ${computerController.filteredComputerList[index].ast_tag}",
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
                                                  "Do you want to delete this Asset?",
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
                                                      deleteAsset(
                                                        computerController
                                                            .filteredComputerList[
                                                                index]
                                                            .ast_id,
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

  // Show Computer Details
  Future<dynamic> showAssetDetails(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: customText(
              label:
                  "${computerController.filteredComputerList[index].ast_name}",
              fontSize: 24,
              labelColor: secondaryColor,
              // fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            height: 500,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const customText(
                        label: "Asset ID: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_id}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Asset Tag No: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_tag}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Serial No: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_serial}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Category: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_category}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Purchase Date: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_purchase_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Price: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_price}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Supplier: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_supplier}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Waranty No: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_warranty}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Licence Name: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_licence}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Licence Date: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_licence_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Licence Expiry: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_licence_expiry}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Licence No: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_licence_no}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Assigned to: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_asignee}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Department: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_department}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Date of Issue: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_issue_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const customText(
                        label: "Asset Status: ",
                        fontSize: 20,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                      ),
                      customText(
                        label:
                            "${computerController.filteredComputerList[index].ast_status}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Connecting to API to Pull Computers
  Future<void> getComputers() async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          "https://mmogaya.com/tectally/asset_categories/computers.php?user_id=${profileController.userId.value}"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var computerResponse = serverResponse['computers'] as List;
      var computerList = computerResponse
          .map((computer) => AssetModel.fromJson(computer))
          .toList();
      computerController.updateComputerList(computerList);
    } else {
      print("Error Occurred");
    }
  }

  // Delete Asset Logic
  Future<void> deleteAsset(ast_id) async {
    http.Response response;
    response = await http.get(
      Uri.parse(
        "https://mmogaya.com/tectally/asset_categories/delete_asset.php?ast_id=$ast_id",
      ),
    );
    if (response.statusCode == 200) {
      getComputers();
    } else {
      print("Error Ocurred");
    }
  }
}
