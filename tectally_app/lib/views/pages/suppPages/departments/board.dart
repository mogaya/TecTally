import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/departments/board_controller.dart';
import 'package:tectally_app/models/employee_model.dart';
import 'package:tectally_app/views/components/customText.dart';

// boardController boardController = Get.put(boardController());
BoardController boardController = Get.put(BoardController());

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();
    getBoard();
  }

  @override
  Widget build(BuildContext context) {
    // getBoard();
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: "Board",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Obx(
        () {
          if (boardController.boardList.isEmpty) {
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
                          boardController.filterBoard(
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
                    itemCount: boardController.filteredBoardList.length,
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
                                        "${boardController.filteredBoardList[index].emp_name}",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                customText(
                                  label:
                                      "Phone: ${boardController.filteredBoardList[index].emp_phone}",
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
                                                      boardController
                                                          .filteredBoardList[
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

  // Show Board Employee Details
  Future<dynamic> showAssetDetails(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: customText(
              label: "${boardController.filteredBoardList[index].emp_name}",
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
                            "${boardController.filteredBoardList[index].emp_id}",
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
                            "${boardController.filteredBoardList[index].emp_dpt}",
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
                            "${boardController.filteredBoardList[index].emp_role}",
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
                            "${boardController.filteredBoardList[index].emp_email}",
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
                            "${boardController.filteredBoardList[index].emp_phone}",
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

  // Connecting to API to Pull Board
  Future<void> getBoard() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://mmogaya.com/tectally/departments/board.php"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      var boardResponse = serverResponse['board'] as List;
      var boardList =
          boardResponse.map((board) => EmployeeModel.fromJson(board)).toList();
      boardController.updateBoardList(boardList);
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
      getBoard();
    } else {
      print("Error Ocurred");
    }
  }
}