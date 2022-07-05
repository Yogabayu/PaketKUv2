import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/view/dashboard.dart';
import 'package:tracking/view/tracking_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // home: const Dashboard(),
      home: Tracking2(),
    );
  }
}
