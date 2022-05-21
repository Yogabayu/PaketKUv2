// ignore_for_file: unused_import

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/component/welcome/button.dart';
import 'package:tracking/component/dashboard/estimasi_button.dart';
import 'package:tracking/component/welcome/signup.dart';
import 'package:tracking/controller/theme_controller.dart';
import 'package:tracking/component/welcome/hero.dart';
import 'package:tracking/component/welcome/title.dart';
import 'package:tracking/page/dashboard.dart';

//theme
final themeController = Get.find<ThemeController>();
// var _index = 0;

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(251, 226, 192, 0),
            Color.fromARGB(156, 255, 249, 183),
          ],
        ),
      ),
      child: ListView(
        children: [
          Hero1(),
          SizedBox(
            height: height * 0.06,
          ),
          Title1(),
          SizedBox(
            height: height * 0.02,
          ),
          Title2(),
          Title3(),
          SizedBox(
            height: height * 0.05,
          ),
          Button1(),
          SizedBox(
            height: height * 0.03,
          ),
          // Signup()
        ],
      ),
    ));
  }
}
