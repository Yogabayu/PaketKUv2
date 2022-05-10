import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tracking/model/api.dart';
import 'package:tracking/page/tracking%20_detail.dart';

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  _Button1State createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  // Initial Selected Value
  String dropdownvalue = 'JNE';
  TextEditingController receipt = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'JNE',
    'POS',
    'JNT',
    'sicepat',
    'TIKI',
    'Anteraja',
    'NINJA',
    'LION',
    'JET',
  ];
  final double height = Get.height;
  final double width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Get.snackbar("Sorry", "Silahkan Isi receipt numbernya"),
                  }
                else
                  {
                    Get.to(
                        () => TrackingDetail(
                              receipt: receipt.text,
                              jk: dropdownvalue,
                              apiKey: apiKey,
                            ),
                        transition: Transition.cupertino),
                  }
              },
            ),
          ],
        ));
  }
}
