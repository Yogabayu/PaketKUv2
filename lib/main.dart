// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paketku/view/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Splash(),
      // home: SplashScreen(
      //   loadingText: new Text(
      //     'Developed by Yoga Dev.',
      //     textAlign: TextAlign.center,
      //     style: GoogleFonts.roboto(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 12.0,
      //       color: Color.fromARGB(255, 5, 78, 94),
      //     ),
      //   ),
      //   seconds: 4,
      //   navigateAfterSeconds: Dashboard(),
      //   title: new Text(
      //     'PaketKU',
      //     textAlign: TextAlign.center,
      //     style: GoogleFonts.roboto(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 30.0,
      //       color: Color.fromARGB(255, 246, 142, 37),
      //     ),
      //   ),
      //   image: new Image.asset('assets/icon/icon.png'),
      //   photoSize: 100.0,
      //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //   styleTextUnderTheLoader: new TextStyle(),
      //   loaderColor: Color.fromARGB(255, 246, 142, 37),
      // ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void startTimeout() {
    Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  void changeScreen() {
    Get.offAll(
      Dashboard(),
      transition: Transition.fadeIn,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/icon/icon.png'),
            ),
            Text(
              'PaketKU',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Color.fromARGB(255, 246, 142, 37),
              ),
            ),
            Text(
              'Developed by Yoga Dev.',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Color.fromARGB(255, 5, 78, 94),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 246, 142, 37),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
