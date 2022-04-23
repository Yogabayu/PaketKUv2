import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/controller/theme_controller.dart';
import 'package:tracking/constants/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.1, right: width * 0.1, top: height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.freepik.com/free-vector/businessman-character-avatar-isolated_6769264.htm#query=user&from_query=user%20png&position=0&from_view=search"),
                    ),
                  ),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
