// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:paketku/controller/tracking_controller.dart';
import 'package:paketku/model/receipt.dart';
import 'package:paketku/view/cekOngkir.dart';
import 'package:paketku/view/dashboard.dart';
import 'package:paketku/view/lainnya.dart';

class Tracking2 extends StatefulWidget {
  String receipt;
  String jk;
  String svg;
  Tracking2({
    super.key,
    required this.receipt,
    required this.jk,
    required this.svg,
  });

  @override
  _Tracking2State createState() => _Tracking2State();
}

class _Tracking2State extends State<Tracking2> {
  final controller = Get.put(TrackingController());
  late Future<Receipt> futureReceipt;

  @override
  void initState() {
    super.initState();
    // print(widget.jk);
    futureReceipt = controller.fetchData("${widget.receipt}", "${widget.jk}");
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    bool _isSukses = true;
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
        resizeToAvoidBottomInset: true,
        floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 55, 202, 236),
            child: Icon(Icons.home),
            onPressed: () {
              Get.offAll(
                () => Dashboard(),
                transition: Transition.fadeIn,
                duration: Duration(seconds: 1),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 202, 236),
          title: Text(
            "Lacak Paket",
            style: GoogleFonts.roboto(
              fontSize: height * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.offAll(
                () => Dashboard(),
                transition: Transition.fade,
                duration: Duration(seconds: 1),
              );
            },
          ),
        ),
        body: ListView(
          children: [
            FutureBuilder<Receipt>(
              future: futureReceipt,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.all(width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 5, 78, 94),
                            ),
                            borderRadius: BorderRadius.circular(width * 0.04),
                          ),
                          width: width * 0.4,
                          height: width * 0.2,
                          child: SvgPicture.asset('${widget.svg}'),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Text(
                          "${snapshot.data!.data!.summary!.service}",
                          style: GoogleFonts.roboto(
                            color:
                                Color.fromARGB(255, 14, 7, 1).withOpacity(0.4),
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: width * 0.03,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: width * 0.008,
                            ),
                            SizedBox(
                              child: Text(
                                "${snapshot.data!.data!.summary!.awb}",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 246, 142, 37),
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    Get.offAll(
                      () => CekOngkir(),
                      transition: Transition.fadeIn,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Container(
                    width: width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.price_change_outlined,
                        ),
                        Text(
                          'Cek Ongkir',
                          style: GoogleFonts.roboto(),
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    Get.offAll(
                      () => Lainnya(),
                      transition: Transition.fadeIn,
                      duration: Duration(seconds: 1),
                    );
                  },
                  child: Container(
                    width: width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dehaze_sharp,
                        ),
                        Text(
                          'Lainnya',
                          style: GoogleFonts.roboto(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
