// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/helper/sql_helper.dart';

import 'package:tracking/model/api.dart';
import 'package:tracking/page/historyAll.dart';
import 'package:tracking/page/tracking%20_detail.dart';
import 'package:tracking/page/welcome.dart';

List<Map<String, dynamic>> _journals = [];
bool _isLoading = true;
String jsKirim = "";

class Dialog_track extends StatefulWidget {
  const Dialog_track({Key? key}) : super(key: key);

  @override
  _Button1State createState() => _Button1State();
}

class _Button1State extends State<Dialog_track> {
  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    // if (data.isEmpty) {
    //   // _isLoading = true;
    // } else {
    setState(() {
      _isLoading = false;
      _journals = data.reversed.toList();
    });
    // }
  }

  Future<void> _addItem() async {
    // var cekData = await SQLHelper.getItem(receipt.text);
    // var cekJk = await SQLHelper.getItem(dropdownvalue);
    // if (cekData.isEmpty || cekJk.isEmpty) {
    //   await SQLHelper.createItem(
    //     receipt.text,
    //     dropdownvalue,
    //   );
    //   Get.to(
    //       () => TrackingDetail(
    //             receipt: receipt.text,
    //             jk: dropdownvalue,
    //             apiKey: apiKey,
    //           ),
    //       transition: Transition.cupertino);
    //   _refreshJournals();
    // } else {
    //   Get.snackbar(
    //     "Maaf",
    //     "Data sudah pernah masuk sebelumnya",
    //     icon: Icon(Icons.block_outlined, color: Colors.red),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.white38,
    //     borderRadius: 20,
    //     margin: EdgeInsets.all(15),
    //     colorText: Colors.black,
    //     duration: Duration(seconds: 2),
    //     isDismissible: true,
    //     dismissDirection: DismissDirection.horizontal,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );
    // }
    await SQLHelper.createItem(
      receipt.text,
      dropdownvalue,
    );
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(id, receipt.text, dropdownvalue);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Sukses menghapus Jadwal!'),
    ));
    _refreshJournals();
  }

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
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: height * 0.4,
          margin: EdgeInsets.only(
            top: width * 0.1,
            left: width * 0.1,
            right: width * 0.1,
            bottom: width * 0.1,
          ),
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: new BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Color.fromARGB(168, 247, 171, 30),
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
                        "Maaf",
                        "Silahkan isi semua kolom",
                        icon: Icon(Icons.block_outlined, color: Colors.red),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.white38,
                        borderRadius: 20,
                        margin: EdgeInsets.all(15),
                        colorText: Colors.black,
                        duration: Duration(seconds: 4),
                        isDismissible: true,
                        dismissDirection: DismissDirection.horizontal,
                        forwardAnimationCurve: Curves.easeOutBack,
                      ),
                    }
                  else
                    {
                      _addItem(),
                      // Get.to(
                      //     () => TrackingDetail(
                      //           receipt: receipt.text,
                      //           jk: dropdownvalue,
                      //           apiKey: apiKey,
                      //         ),
                      //     transition: Transition.cupertino),
                    }
                },
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.1, top: height * 0.03, right: width * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tracking History",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: width * 0.15,
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () => {
                      Get.to(
                        () => HistoryAll(),
                        transition: Transition.cupertino,
                      ),
                    },
                  )
                ],
              ),
            ),
            Container(
              height: height * 0.4,
              margin: EdgeInsets.only(
                  left: width * 0.1, right: width * 0.1, top: height * 0.02),
              child: ListView(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _journals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => {
                                Get.to(
                                  () => TrackingDetail(
                                    receipt: _journals[index]['receipt'],
                                    jk: _journals[index]['jkirim'],
                                    apiKey: apiKey,
                                  ),
                                  transition: Transition.cupertino,
                                ),
                              },
                              child: Icon(
                                CupertinoIcons.cart_fill,
                                size: 20,
                                // color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Get.to(
                                  () => TrackingDetail(
                                    receipt: _journals[index]['receipt'],
                                    jk: _journals[index]['jkirim'],
                                    apiKey: apiKey,
                                  ),
                                  transition: Transition.cupertino,
                                ),
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      _journals[index]['receipt'],
                                      style: GoogleFonts.lato(
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height * 0.009,
                                    ),
                                    Text(
                                      _journals[index]['jkirim'],
                                      style: GoogleFonts.lato(
                                        fontSize: height * 0.017,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Get.to(
                                  () => TrackingDetail(
                                    receipt: _journals[index]['receipt'],
                                    jk: _journals[index]['jkirim'],
                                    apiKey: apiKey,
                                  ),
                                  transition: Transition.cupertino,
                                ),
                              },
                              child: Icon(
                                CupertinoIcons.arrow_right,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
