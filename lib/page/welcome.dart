import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/controller/theme_controller.dart';
// import 'package:tracking/constants/theme.dart';
import 'package:tracking/page/dashboard.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final w = Get.width;
    final h = Get.height;
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 214, 206, 137),
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            // Color.fromARGB(156, 245, 196, 20),
            // Color.fromRGBO(255, 237, 34, 100),
            Color.fromARGB(251, 226, 192, 0),
            Color.fromARGB(156, 255, 249, 183),
          ],
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height / 2,
            child: Stack(
              children: [
                FadeInDown(
                  delay: const Duration(milliseconds: 100),
                  child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Color.fromARGB(255, 244, 233, 179),
                    ),
                    child: FadeInDown(
                      delay: const Duration(milliseconds: 1600),
                      child: Spin(
                        delay: const Duration(milliseconds: 2000),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0), //or 15.0
                          child: Container(
                            height: height / 2,
                            width: width,
                            child: Image.asset("assets/image/final.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Center(
            child: FadeInUp(
              delay: const Duration(milliseconds: 1600),
              child: SizedBox(
                // width: w / 1.5,
                // height: h / 10,
                child: Center(
                  child: Text(
                    "Welcome To TrackPad",
                    style: GoogleFonts.lato(
                        fontSize: height * 0.04, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: FadeInUp(
              delay: const Duration(milliseconds: 1600),
              child: SizedBox(
                child: Center(
                  child: Text(
                    "Track Your Package and make sure",
                    style: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: FadeInUp(
              delay: const Duration(milliseconds: 1600),
              child: SizedBox(
                child: Center(
                  child: Text(
                    "it arrives to destination",
                    style: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: FadeInUp(
              delay: const Duration(milliseconds: 1600),
              child: SizedBox(
                child: Center(
                  child: InkWell(
                    child: Container(
                        width: width / 2,
                        height: height / 18,
                        margin: EdgeInsets.only(
                            left: width * 0.2, right: width * 0.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/google_logo.png'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))),
                    onTap: () => {
                      // print("object"),
                      // Get.to(() => Dashboard()),
                      Get.offAll(() => Dashboard(),
                          transition: Transition.cupertino),
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child: FadeInUp(
              delay: const Duration(milliseconds: 1600),
              child: SizedBox(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have any account ? ',
                      style: TextStyle(
                        fontSize: height * 0.015,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('The button is clicked!');
                              },
                            style: TextStyle(
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
