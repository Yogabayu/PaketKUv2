// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:tracking/component/dashboard/display_name.dart';
import 'package:tracking/component/dashboard/head.dart';
import 'package:tracking/component/dashboard/track_button.dart';
import 'package:tracking/constants/constant.dart';

import '../component/dashboard/estimasi_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressed;
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning =
            lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();

          final snackBar = SnackBar(
            content: Text('Double Tap To Close App'),
            duration: maxDuration,
          );

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(snackBar);

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 10),
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
              Head(),
              SizedBox(
                height: height * 0.03,
              ),
              DisplayName(),
              SizedBox(
                height: height * 0.03,
              ),
              // Button1(),
              SizedBox(
                height: height * 0.03,
              ),
              TrackButton(),
              SizedBox(
                height: height * 0.03,
              ),
              Button2(),
            ],
          ),
        ),
      ),
    );
  }
}
