import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/asset_categories_controllers/computer_controller.dart';
import 'package:tectally_app/models/computer_model.dart';
import 'package:tectally_app/views/components/customText.dart';

ComputerController computerController = Get.put(ComputerController());

class Computers extends StatefulWidget {
  const Computers({super.key});

  @override
  State<Computers> createState() => _ComputersState();
}

class _ComputersState extends State<Computers> {
  final SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();
    getComputers();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: _searchController,
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        _searchController.openView();
                      },
                      onChanged: (_) {
                        _searchController.openView();
                      },
                      leading: const Icon(Icons.search),
                    );
                  }, suggestionsBuilder:
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
                  }),
                ),

                // Assets List
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: computerController.computerList.length,
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
                                        "${computerController.computerList[index].ast_name}",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                customText(
                                  label:
                                      "Tag No. ${computerController.computerList[index].ast_tag}",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: const customText(
                                label: "REMOVE",
                                fontWeight: FontWeight.bold,
                                labelColor: Colors.red,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      );
                      // return ListTile(
                      //   title: Text(
                      //       "${computerController.computerList[index].ast_name}"),
                      // );
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

  // Show Computer Details
  Future<dynamic> showAssetDetails(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: customText(
                label: "${computerController.computerList[index].ast_name}",
                fontSize: 24,
                labelColor: secondaryColor,
                // fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Container(
              height: 500,
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
                            "${computerController.computerList[index].ast_id}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_tag}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  // customText(
                  //   label:
                  //       "Asset Tag No: ${computerController.computerList[index].ast_tag}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_serial}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  SizedBox(
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
                            "${computerController.computerList[index].ast_category}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Category: ${computerController.computerList[index].ast_category}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_purchase_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Purchase Date: ${computerController.computerList[index].ast_purchase_date}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_price}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Price: ${computerController.computerList[index].ast_price}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_supplier}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Supplier: ${computerController.computerList[index].ast_supplier}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_warranty}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Waranty No: ${computerController.computerList[index].ast_warranty}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_licence}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Licence Name: ${computerController.computerList[index].ast_licence}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_licence_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Licence Issue Date: ${computerController.computerList[index].ast_licence_date}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_licence_expiry}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Licence Expiry Date: ${computerController.computerList[index].ast_licence_expiry}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_licence_no}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Licence No: ${computerController.computerList[index].ast_licence_no}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_asignee}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Assigned to: ${computerController.computerList[index].ast_asignee}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_department}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Department: ${computerController.computerList[index].ast_department}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_issue_date}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Date of Issue: ${computerController.computerList[index].ast_issue_date}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
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
                            "${computerController.computerList[index].ast_status}",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  // customText(
                  //   label:
                  //       "Asset Status: ${computerController.computerList[index].ast_status}",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> getComputers() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://mmogaya.com/tectally/asset_categories/computers.php"),
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
}
