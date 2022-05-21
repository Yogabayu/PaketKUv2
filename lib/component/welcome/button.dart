import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracking/page/dashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:tracking/model/data_tracking.dart';

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button1> {
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
              child: isLoading
                  ? InkWell(
                      child: Container(
                          width: width / 1.5,
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
                                height: height * 0.04,
                                width: height * 0.04,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/image/right-arrow.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                'Let\s Begin',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))),
                      onTap: () async {
                        isLoading = false;
                        print(isLoading);
                        Get.offAll(() => Dashboard(),
                            transition: Transition.cupertino);
                      },
                    )
                  : InkWell(
                      child: Container(
                          width: width / 1.5,
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
                              Text(
                                'Masuk',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))),
                      onTap: () async {
                        Get.offAll(() => Dashboard(),
                            transition: Transition.cupertino);
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
