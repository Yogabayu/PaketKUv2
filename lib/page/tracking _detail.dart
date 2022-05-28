import 'dart:io';

import 'package:http/io_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'dart:async';
import 'dart:convert';

class TrackingDetail extends StatefulWidget {
  const TrackingDetail({
    Key? key,
    required this.receipt,
    required this.jk,
    required this.apiKey,
  }) : super(key: key);

  final String receipt;
  final String jk;
  final String apiKey;
  @override
  _TrackingDetailState createState() => _TrackingDetailState();
}

class _TrackingDetailState extends State<TrackingDetail> {
  String jKirim = "";
  bool isRight = false;
  List<dynamic> data = []; //edited line
  Map<String, dynamic> map = {};
  Future<String> getSWData() async {
    if ("${widget.jk}" == 'Shopee express') {
      setState(() {
        jKirim = "spx";
        print(jKirim);
      });
    } else if ("${widget.jk}" == 'SAP express') {
      setState(() {
        jKirim = "sap";
        print(jKirim);
      });
    } else if ("${widget.jk}" == 'ID express') {
      setState(() {
        jKirim = "ide";
        print(jKirim);
      });
    } else {
      setState(() {
        jKirim = "${widget.jk}";
        print(jKirim);
      });
    }
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    await http
        .get(
      Uri.parse(
          "https://api.binderbyte.com/v1/track?api_key=${widget.apiKey}&courier=" +
              jKirim +
              "&awb=${widget.receipt}"),
    )
        .then((response) {
      if (response.statusCode == 200) {
        isRight = true;
        setState(() {
          map = new Map<String, dynamic>.from(json.decode(response.body));
          // print(map['data']['history']);
          data = map['data']['history'];
          print(data);
        });
      } else {
        isRight = false;
        Get.snackbar(
          "Maaf",
          "Data tidak ditemukan",
          icon: Icon(Icons.block_outlined, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(96, 254, 172, 31),
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.black,
          duration: Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    });
    return "sukses";
    // print(response);
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => {
                    Get.back(),
                  },
                  child: Container(
                    margin: EdgeInsets.all(height * 0.04),
                    child: Icon(
                      CupertinoIcons.back,
                      size: height * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(height * 0.04),
                  child: Text(
                    "Tracking Details",
                    style: GoogleFonts.lato(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Color.fromARGB(156, 253, 238, 70),
              height: height * 0.09,
              width: width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.receipt}',
                      style: GoogleFonts.lato(
                        fontSize: height * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Jasa Kirim : " + jKirim,
                      style: GoogleFonts.lato(
                        fontSize: height * 0.02,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isRight
                ? Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                      top: width * 0.03,
                      // bottom: width * 0.1,
                    ),
                    height: height * 0.7,
                    width: width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index % 2 == 0) {
                            return TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              endChild: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                constraints: const BoxConstraints(
                                  minHeight: 120,
                                ),
                                // color: Colors.amber,
                                child: ListTile(
                                  title: Text(data[index]['desc']),
                                  subtitle: Text(data[index]['date']),
                                ),
                                // color: Colors.lightGreenAccent,
                              ),
                              startChild: Container(
                                // color: Colors.amberAccent,
                                child: Icon(
                                  CupertinoIcons.cart_fill,
                                  size: 20,
                                  // color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            return TimelineTile(
                              alignment: TimelineAlign.manual,
                              lineXY: 0.3,
                              endChild: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                constraints: const BoxConstraints(
                                  minHeight: 120,
                                ),
                                // color: Colors.amber,
                                child: ListTile(
                                  title: Text(data[index]['desc']),
                                  subtitle: Text(data[index]['date']),
                                ),
                                // color: Colors.lightGreenAccent,
                              ),
                              startChild: Container(
                                // color: Colors.amberAccent,
                                child: Icon(
                                  CupertinoIcons.cart,
                                  size: 20,
                                  // color: Colors.white,
                                ),
                              ),
                            );
                          }
                        }),
                  )
                : Container(
                    margin: EdgeInsets.only(
                      top: width * 0.03,
                    ),
                    height: height * 0.05,
                    width: width * 0.03,
                    child: Text(
                      "Mengambil data .....",
                      textAlign: TextAlign.center,
                    )),
          ],
        ),
      ),
    );
  }
}
