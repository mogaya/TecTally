import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        title: customText(
          label: "Departments",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {Get.toNamed('/hr_users')},
                child: Container(
                  color: secondaryColor,
                  width: 320,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svg/hr.svg",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      customText(
                        label: "HUMAN RESOURCE",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // ICT Users
              GestureDetector(
                onTap: () => {Get.toNamed('/ict_users')},
                child: Container(
                  color: secondaryColor,
                  width: 320,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svg/ict.svg",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      customText(
                        label: "ICT",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // Finance Users
              GestureDetector(
                onTap: () => {Get.toNamed('/finance_users')},
                child: Container(
                  color: secondaryColor,
                  width: 320,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svg/finance2.svg",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      customText(
                        label: "FINANCE",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              // procurement Users
              GestureDetector(
                onTap: () => {Get.toNamed('/procurement_users')},
                child: Container(
                  color: secondaryColor,
                  width: 320,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/svg/procurement.svg",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      customText(
                        label: "PROCUREMENT",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
