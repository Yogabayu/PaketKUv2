import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/page/dashboard.dart';

class Button1 extends StatelessWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Get.snackbar("button", "button google clicked"),
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
