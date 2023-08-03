import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pattern_app/controllers/navigationbar_controller.dart';
import 'package:pattern_app/controllers/slider_controller.dart';
import 'package:pattern_app/controllers/theme_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double initialsliderval = 5;

  ThemeAccessController themeAccessController =
      Get.put(ThemeAccessController());

  NavigationBarController navigationBarController =
      Get.put(NavigationBarController());

  SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patterns App",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GetBuilder<ThemeAccessController>(
            builder: (_) {
              return IconButton(
                onPressed: () {
                  themeAccessController.changeTheme();
                },
                icon: (themeAccessController.themeAccessModel.isDark)
                    ? const Icon(CupertinoIcons.sun_min)
                    : const Icon(CupertinoIcons.moon_stars_fill),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  for (int i = 1;
                      i <=
                          sliderController.sliderModel.initialsliderval.toInt();
                      i++)
                    Row(
                      children: [
                        for (int j = 1; j <= i; j++)
                          (navigationBarController
                                      .navigationBarModel.initialval ==
                                  0)
                              ? Text(
                                  "$j",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              : Text(
                                  "* ",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )
                      ],
                    )
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<SliderController>(
                builder: (_) {
                  return Slider(
                    min: 1,
                    max: 10,
                    value: sliderController.sliderModel.initialsliderval,
                    onChanged: (val) {
                      setState(
                        () {
                          sliderController.sliderModel.initialsliderval = val;
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<NavigationBarController>(
        builder: (_) {
          return NavigationBar(
            selectedIndex:
                navigationBarController.navigationBarModel.initialval,
            onDestinationSelected: (val) {
              setState(() {
                navigationBarController.navigationBarModel.initialval = val;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.onetwothree,
                ),
                label: "Number",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.star,
                ),
                label: "Star",
              ),
            ],
          );
        },
      ),
    );
  }
}
