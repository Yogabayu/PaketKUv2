// import 'package:tracking/component/welcome/button.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/component/dashboard.dart/button1.dart';
import 'package:tracking/component/dashboard.dart/display_name.dart';
import 'package:tracking/component/dashboard.dart/track_button.dart';
import 'package:tracking/page/tracking%20_detail.dart';
import 'package:tracking/page/welcome.dart';

import 'package:tracking/model/data_tracking.dart';
import 'package:tracking/model/api.dart';

import '../component/dashboard.dart/button2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.displayName, required this.photo})
      : super(key: key);

  final String displayName;
  final String photo;
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color.fromARGB(226, 255, 255, 255),
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
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
                      backgroundImage: NetworkImage("${widget.photo}"),
                      radius: 30, //Text
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      isLoading = true;
                      print(isLoading);
                      FirebaseService service = new FirebaseService();
                      service.signOutFromGoogle();
                      Get.offAll(() => Welcome(),
                          transition: Transition.cupertino);
                    },
                    child: Icon(
                      CupertinoIcons.square_arrow_right,
                      size: 40,
                      // color: Colors.white,
                    ),
                    // child: CircleAvatar(
                    //   // backgroundColor: Color.fromARGB(225, 181, 180, 180),
                    //   backgroundColor: Colors.transparent,
                    //   backgroundImage:
                    //       AssetImage('assets/image/notification.png'),
                    //   radius: 15, //Text
                    // ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * 0.03,
            ),
            DisplayName(displayName: "${widget.displayName}"),
            SizedBox(
              height: height * 0.03,
            ),
            Button1(),
            SizedBox(
              height: height * 0.03,
            ),
            TrackButton(),
            SizedBox(
              height: height * 0.03,
            ),
            Button2(),
            // Container(
            //   margin: EdgeInsets.only(left: width * 0.1),
            //   child: Text(
            //     "Tracking History",
            //     style: TextStyle(
            //       fontSize: width * 0.05,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Container(
            //     height: height * 0.22,
            //     margin: EdgeInsets.only(
            //         left: width * 0.1, right: width * 0.1, top: height * 0.02),
            //     child: ListView(
            //       children: [
            //         Container(
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               GestureDetector(
            //                 onTap: () => {
            //                   print("user"),
            //                 },
            //                 child: CircleAvatar(
            //                   backgroundImage:
            //                       AssetImage('assets/image/user.jpg'),
            //                   radius: 25, //Text
            //                 ),
            //               ),
            //               GestureDetector(
            //                 onTap: () => {
            //                   print("user"),
            //                 },
            //                 child: Container(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         "SPC98647836",
            //                         style: GoogleFonts.lato(
            //                             fontSize: height * 0.02,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                       SizedBox(
            //                         height: height * 0.009,
            //                       ),
            //                       Text(
            //                         "SPC98647836",
            //                         style: GoogleFonts.lato(
            //                           fontSize: height * 0.017,
            //                           fontWeight: FontWeight.bold,
            //                           color: Colors.black.withOpacity(0.4),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               GestureDetector(
            //                   onTap: () => {
            //                         print("notif clicked"),
            //                       },
            //                   child: Icon(
            //                     CupertinoIcons.arrow_right,
            //                     size: 20,
            //                   )),
            //             ],
            //           ),
            //         ),
            //   Container(
            //     margin: EdgeInsets.only(top: width * 0.03),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: CircleAvatar(
            //             backgroundImage:
            //                 AssetImage('assets/image/user.jpg'),
            //             radius: 25, //Text
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: Container(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                       fontSize: height * 0.02,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: height * 0.009,
            //                 ),
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                     fontSize: height * 0.017,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black.withOpacity(0.4),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //             onTap: () => {
            //                   print("notif clicked"),
            //                 },
            //             child: Icon(
            //               CupertinoIcons.arrow_right,
            //               size: 20,
            //             )),
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.only(top: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: CircleAvatar(
            //             backgroundImage:
            //                 AssetImage('assets/image/user.jpg'),
            //             radius: 25, //Text
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: Container(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                       fontSize: height * 0.02,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: height * 0.009,
            //                 ),
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                     fontSize: height * 0.017,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black.withOpacity(0.4),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //             onTap: () => {
            //                   print("notif clicked"),
            //                 },
            //             child: Icon(
            //               CupertinoIcons.arrow_right,
            //               size: 20,
            //             )),
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.only(top: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: CircleAvatar(
            //             backgroundImage:
            //                 AssetImage('assets/image/user.jpg'),
            //             radius: 25, //Text
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: Container(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                       fontSize: height * 0.02,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: height * 0.009,
            //                 ),
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                     fontSize: height * 0.017,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black.withOpacity(0.4),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //             onTap: () => {
            //                   print("notif clicked"),
            //                 },
            //             child: Icon(
            //               CupertinoIcons.arrow_right,
            //               size: 20,
            //             )),
            //       ],
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.only(top: 10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: CircleAvatar(
            //             backgroundImage:
            //                 AssetImage('assets/image/user.jpg'),
            //             radius: 25, //Text
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () => {
            //             print("user"),
            //           },
            //           child: Container(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                       fontSize: height * 0.02,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: height * 0.009,
            //                 ),
            //                 Text(
            //                   "SPC98647836",
            //                   style: GoogleFonts.lato(
            //                     fontSize: height * 0.017,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black.withOpacity(0.4),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //             onTap: () => {
            //                   print("notif clicked"),
            //                 },
            //             child: Icon(
            //               CupertinoIcons.arrow_right,
            //               size: 20,
            //             )),
            //       ],
            //     ),
            //   ),
            //   ],
            // )),
          ],
        ),
      ),
    );
  }
}

class $ {}
