import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/controller/theme_controller.dart';
import 'package:tracking/constants/theme.dart';

//theme
final themeController = Get.find<ThemeController>();
var _index = 0;

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 214, 206, 137),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(255, 222, 102, 100),
              Color.fromRGBO(255, 237, 34, 100),
            ],
          )),
          child: ListView(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), //or 15.0
                  child: Container(
                    height: height / 3,
                    width: width,
                    child: Image.asset("assets/image/astronout.png"),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              Center(
                child: Text(
                  "Welcome To TrackPad",
                  style: TextStyle(
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: Text(
                  "Track Your Package and make sure \nit arrives to destination",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
