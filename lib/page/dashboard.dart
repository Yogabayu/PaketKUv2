import 'package:flutter/material.dart';
import 'package:tracking/component/dashboard/display_name.dart';
import 'package:tracking/component/dashboard/head.dart';
import 'package:tracking/component/dashboard/track_button.dart';
import 'package:tracking/constants/constant.dart';

import '../component/dashboard/estimasi_button.dart';

class Dashboard extends StatefulWidget {
  final String displayName;
  final String photo;
  const Dashboard({Key? key, required this.displayName, required this.photo})
      : super(key: key);

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
            Head(photo: "${widget.photo}", name: "${widget.displayName}"),
            SizedBox(
              height: height * 0.03,
            ),
            DisplayName(displayName: "${widget.displayName}"),
            SizedBox(
              height: height * 0.03,
            ),
            // Button1(),
            SizedBox(
              height: height * 0.03,
            ),
            TrackButton(
              photo: '${widget.photo}',
              name: '${widget.displayName}',
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Button2(
              foto: '${widget.photo}',
              name: "${widget.displayName}",
            ),
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
