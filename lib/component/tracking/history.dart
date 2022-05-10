import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constants/constant.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: width * 0.1, top: height * 0.03),
          child: Text(
            "Tracking History",
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: height * 0.22,
          margin: EdgeInsets.only(
              left: width * 0.1, right: width * 0.1, top: height * 0.02),
          child: ListView(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.jpg'),
                        radius: 25, //Text
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              print("notif clicked"),
                            },
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.jpg'),
                        radius: 25, //Text
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              print("notif clicked"),
                            },
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.jpg'),
                        radius: 25, //Text
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              print("notif clicked"),
                            },
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.jpg'),
                        radius: 25, //Text
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              print("notif clicked"),
                            },
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/image/user.jpg'),
                        radius: 25, //Text
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        print("user"),
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "SPC98647836",
                              style: GoogleFonts.lato(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                              print("notif clicked"),
                            },
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
