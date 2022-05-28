import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constants/constant.dart';
import 'package:tracking/helper/sql_helper.dart';
import 'package:tracking/model/api.dart';
import 'package:tracking/page/tracking%20_detail.dart';
import 'package:tracking/page/welcome.dart';

List<Map<String, dynamic>> _journals = [];
String jsKirim = "";

class HistoryAll extends StatefulWidget {
  const HistoryAll({Key? key}) : super(key: key);

  @override
  _HistoryAllState createState() => _HistoryAllState();
}

class _HistoryAllState extends State<HistoryAll> {
  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

// Delete an item
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
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => {
                            Get.back(),
                          },
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                      )),
                  GestureDetector(
                    onTap: () async {
                      Get.offAll(() => Welcome(),
                          transition: Transition.cupertino);
                    },
                    child: Icon(
                      CupertinoIcons.square_arrow_right,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.1),
              child: Text(
                "Riwayat Pelacakan",
                maxLines: 2,
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
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
                    height: height * 0.7,
                    margin: EdgeInsets.only(
                      left: width * 0.1,
                      right: width * 0.1,
                      top: height * 0.02,
                      bottom: height * 0.02,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _journals.length,
                          itemBuilder: (context, index) {
                            return Container(
                              // margin: EdgeInsets.only(bottom: width * 0.04),
                              // color: Colors.amber,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      size: 25,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.04,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      _deleteItem(_journals[index]['id']),
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus_circle_fill,
                                      size: 25,
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
      ),
    );
  }
}
