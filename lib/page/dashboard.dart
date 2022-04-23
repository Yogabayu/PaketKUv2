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
                  left: width * 0.1, right: width * 0.1, top: height * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      print("user"),
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/image/user.jpg'),
                      radius: 30, //Text
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      print("notif clicked"),
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(225, 181, 180, 180),
                      backgroundImage:
                          AssetImage('assets/image/notification.png'),
                      radius: 15, //Text
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.1),
              child: Text(
                "Hello, John",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
                height: height * 0.4,
                margin: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Color.fromARGB(255, 240, 208, 48),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: width * 0.1,
                        left: width * 0.1,
                        right: width * 0.1,
                      ),
                      child: Text(
                        "Track Your Package",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: width * 0.03,
                        left: width * 0.1,
                        right: width * 0.1,
                      ),
                      child: Text(
                        "Enter the receipt number that has been given by the officer",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                          width: width * 2,
                          height: height / 18,
                          margin: EdgeInsets.only(
                            top: width * 0.09,
                            left: width * 0.1,
                            right: width * 0.1,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Enter Receipt Number',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ],
                          ))),
                      onTap: () => {
                        print("object"),
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: width * 2,
                          height: height / 18,
                          margin: EdgeInsets.only(
                            top: width * 0.03,
                            left: width * 0.1,
                            right: width * 0.1,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Track Now ->',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))),
                      onTap: () => {
                        print("object"),
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.1),
              child: Text(
                "Tracking History",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
