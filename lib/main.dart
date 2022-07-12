// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tracking/view/dashboard.dart';

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
        home: SplashScreen(
          loadingText: new Text(
            'Developed by Yoga Dev.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Color.fromARGB(255, 5, 78, 94),
            ),
          ),
          seconds: 4,
          navigateAfterSeconds: Dashboard(),
          title: new Text(
            'PaketKU',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Color.fromARGB(255, 246, 142, 37),
            ),
          ),
          image: new Image.asset('assets/image/logo1.png'),
          photoSize: 100.0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          styleTextUnderTheLoader: new TextStyle(),
          loaderColor: Color.fromARGB(255, 246, 142, 37),
        ));
  }
}
