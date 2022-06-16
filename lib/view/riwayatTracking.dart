import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constant/constantVariabel.dart';
import 'package:tracking/helper/sql_helper.dart';
import 'package:tracking/view/dashboard.dart';
import 'package:tracking/view/tracking.dart';

List<Map<String, dynamic>> _journals = [];
String jsKirim = "";

class RiwayatTracking extends StatefulWidget {
  const RiwayatTracking({Key? key}) : super(key: key);

  @override
  State<RiwayatTracking> createState() => _RiwayatTrackingState();
}

class _RiwayatTrackingState extends State<RiwayatTracking> {
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  void _deleteItem(int id) async {
    final maxDuration = Duration(seconds: 2);
    await SQLHelper.deleteItem(id);
    final snackBar = SnackBar(
      content: Text('Sukses menghapus'),
      duration: maxDuration,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
    _refreshJournals();
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(
          () => Dashboard(),
          transition: Transition.fade,
          duration: Duration(seconds: 1),
        );
        return false;
      },
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Get.offAll(
                          () => Dashboard(),
                          transition: Transition.fade,
                          duration: Duration(seconds: 1),
                        ),
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: height * 0.03,
                        color: Color.fromARGB(255, 4, 120, 122),
                      ),
                    ),
                    Text(
                      "Riwayat Tracking",
                      style: GoogleFonts.raleway(
                        fontSize: height * 0.025,
                        color: Color.fromARGB(255, 4, 120, 122),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(""),
                  ],
                ),
              ),
              _journals.isEmpty
                  ? Container(
                      height: height * 0.2,
                      child: Center(
                          child: Text(
                        "Data kosong",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                        top: width * 0.05,
                        bottom: width * 0.35,
                      ),
                      height: height,
                      width: width,
                      child: ListView.builder(
                        itemCount: _journals.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => Tracking(
                                  receipt: _journals[index]['receipt'],
                                  jk: _journals[index]['jkirim'],
                                ),
                                transition: Transition.fade,
                                duration: Duration(seconds: 1),
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(width * 0.05),
                                  margin: EdgeInsets.only(
                                      left: width * 0.05,
                                      right: width * 0.05,
                                      bottom: width * 0.05),
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      Radius.circular(width * 0.05),
                                    ),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 4, 120, 122)
                                          .withOpacity(0.3),
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: width * 0.8,
                                  height: width * 0.22,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Nomor Resi:  "),
                                          Text(_journals[index]['receipt']),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Jasa Pengiriman: "),
                                          Text(_journals[index]['jkirim']),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    _deleteItem(_journals[index]['id']),
                                  },
                                  child: Icon(
                                    CupertinoIcons.trash,
                                    size: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
