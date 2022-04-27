import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracking/page/tracking%20_detail.dart';
import 'package:tracking/page/welcome.dart';
// import 'package:tracking/controller/theme_controller.dart';
// import 'package:tracking/constants/theme.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.user}) : super(key: key);

  final String user;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
// Initial Selected Value
  String dropdownvalue = 'JNE';
  TextEditingController receipt = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'JNE',
    'JNT',
    'Ninja',
    'SiCepat Halu',
    'POS',
  ];
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
                      backgroundImage: AssetImage('assets/image/user.jpg'),
                      radius: 30, //Text
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      _googleSignIn.signOut().then((value) => Get.offAll(
                          () => Welcome(),
                          transition: Transition.cupertino))
                    },
                    child: CircleAvatar(
                      // backgroundColor: Color.fromARGB(225, 181, 180, 180),
                      backgroundColor: Colors.transparent,
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
                "Hello, ${widget.user}",
                maxLines: 2,
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
                  color: Color.fromARGB(255, 247, 211, 30),
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
                    Container(
                      width: width * 2,
                      height: height / 18,
                      margin: EdgeInsets.only(
                        top: width * 0.09,
                        left: width * 0.1,
                        right: width * 0.1,
                      ),
                      child: Center(
                        child: TextField(
                          controller: receipt,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: "input here",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 1, 2)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    // width: 3,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.52,
                      height: height / 18,
                      margin: EdgeInsets.only(
                        // top: width * 0.2,
                        left: width * 0.2,
                        right: width * 0.2,
                      ),
                      child: Center(
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Track Now ',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: 20,
                                color: Colors.white,
                              )
                            ],
                          ))),
                      onTap: () => {
                        // print(receipt.text),
                        // print(dropdownvalue),
                        if (receipt.text.isEmpty)
                          {
                            Get.snackbar(
                                "Sorry", "Silahkan Isi receipt numbernya"),
                          }
                        else
                          {
                            Get.to(
                                () => TrackingDetail(
                                      receipt: receipt.text,
                                      jk: dropdownvalue,
                                    ),
                                transition: Transition.cupertino),
                          }
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
                              backgroundImage:
                                  AssetImage('assets/image/user.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/image/user.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/image/user.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/image/user.jpg'),
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
                              backgroundImage:
                                  AssetImage('assets/image/user.jpg'),
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
                )),
          ],
        ),
      ),
    );
  }
}
