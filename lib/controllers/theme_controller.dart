import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_app/models/theme_model.dart';

class ThemeAccessController extends GetxController {
  ThemeAccessModel themeAccessModel = ThemeAccessModel(isDark: false);

  changeTheme() {
    themeAccessModel.isDark = !themeAccessModel.isDark;

    (Get.isDarkMode)
        ? Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.light))
        : Get.changeTheme(
            ThemeData(useMaterial3: true, brightness: Brightness.dark));
    update();
  }
}
