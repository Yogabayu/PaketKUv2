import 'package:animate_do/animate_do.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracking/page/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;
    GoogleSignInAccount? _userObj;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            child: Center(
              child: InkWell(
                child: Container(
                    width: width / 1.5,
                    height: height / 18,
                    margin:
                        EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/image/google_logo.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // Text(
                        //   'Let\'s Begin',
                        //   style: TextStyle(
                        //       fontSize: height * 0.02,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.white),
                        // ),
                        // Icon(
                        //   CupertinoIcons.arrow_right_circle,
                        //   size: 20,
                        //   color: Colors.white,
                        // ),
                      ],
                    ))),
                onTap: () => {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData;
                      print(_userObj!.displayName);
                      final String? user = _userObj!.displayName;

                      Get.offAll(() => Dashboard(user: user!),
                          transition: Transition.cupertino);
                    });
                  }).catchError((e) {
                    print(e);
                  })
                  // Get.snackbar("button", "button google clicked"),
                  // Get.offAll(() => Dashboard(),
                  //     transition: Transition.cupertino),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
