import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/constants/theme.dart';
import 'package:tracking/controller/theme_controller.dart';
import 'package:tracking/page/welcome.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeController.theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const Welcome(),
    );
  }
}
