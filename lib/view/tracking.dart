// ignore_for_file: must_be_immutable, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paketku/controller/tracking_controller.dart';
import 'package:paketku/model/receipt.dart';
import 'package:paketku/view/cekOngkir.dart';
import 'package:paketku/view/dashboard.dart';
import 'package:paketku/view/lainnya.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
    futureReceipt = controller.fetchData(widget.receipt, widget.jk);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    bool _isSukses = true;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await Get.offAll(
            () => Dashboard(),
            transition: Transition.fade,
            duration: Duration(seconds: 1),
          );
        }
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
            // First FutureBuilder for Package Details
            FutureBuilder<Receipt>(
              future: futureReceipt,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: width * 0.03),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromARGB(255, 5, 78, 94)),
                          borderRadius: BorderRadius.circular(width * 0.04),
                        ),
                        width: width * 0.4,
                        height: width * 0.2,
                        child: SvgPicture.asset(widget.svg),
                      ),
                      SizedBox(height: width * 0.01),
                      Text(
                        "${snapshot.data!.data!.summary!.service}",
                        style: GoogleFonts.roboto(
                          color: Color.fromARGB(102, 14, 7, 1),
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: width * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copy,
                              size: width * 0.03,
                              color: Colors.black.withAlpha(128)),
                          SizedBox(width: width * 0.008),
                          Text(
                            "${snapshot.data!.data!.summary!.awb}",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 246, 142, 37),
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          '${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        InkWell(
                          child: Container(
                            width: width * 2,
                            height: height / 18,
                            margin: EdgeInsets.only(
                              top: width * 0.03,
                              left: width * 0.35,
                              right: width * 0.35,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 2, 148, 46)),
                            child: Center(
                              child: Text(
                                'Retry',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () => Get.offAll(
                            () => Tracking2(
                                receipt: widget.receipt,
                                jk: widget.jk,
                                svg: widget.svg),
                            transition: Transition.fade,
                            duration: Duration(seconds: 1),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),

            Divider(thickness: 5, color: Colors.black.withAlpha(25)),

            // Second FutureBuilder for Delivery Details
            FutureBuilder<Receipt>(
              future: futureReceipt,
              builder: (context, snapshot) => Container(
                margin: EdgeInsets.all(width * 0.03),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var title in [
                          "Kota Asal",
                          "Status",
                          "Kota Tujuan"
                        ])
                          Expanded(
                            child: Text(
                              title,
                              style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 5, 78, 94),
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            snapshot.hasData
                                ? (snapshot.data!.data!.detail?.origin == "" ||
                                        snapshot.data!.data!.detail?.origin ==
                                            null
                                    ? "*****"
                                    : snapshot.data!.data!.detail?.origin ??
                                        "*****")
                                : "*****",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 246, 142, 37),
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            snapshot.hasData
                                ? (snapshot.data!.data!.summary!.status
                                            ?.isEmpty ??
                                        true
                                    ? "Sedang di Proses"
                                    : snapshot.data!.data!.summary!.status ??
                                        "")
                                : "",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 246, 142, 37),
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            snapshot.hasData
                                ? (snapshot.data!.data!.detail?.destination ==
                                            "" ||
                                        snapshot.data!.data!.detail
                                                ?.destination ==
                                            null
                                    ? "*****"
                                    : snapshot
                                            .data!.data!.detail?.destination ??
                                        "*****")
                                : "*****",
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 246, 142, 37),
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (snapshot.hasError)
                      Center(
                          child: Text("${snapshot.error}",
                              textAlign: TextAlign.center)),
                    if (!snapshot.hasData && !snapshot.hasError)
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),

            Divider(thickness: 5, color: Colors.black.withAlpha(25)),

            // Status Paket Header
            Container(
              margin: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.03,
                top: width * 0.03,
                bottom: width * 0.03,
              ),
              child: Text(
                "Status Paket",
                style: GoogleFonts.roboto(
                  color: Color.fromARGB(255, 5, 78, 94),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Timeline Status
            SizedBox(
              width: width,
              height: width * 0.9,
              child: FutureBuilder<Receipt>(
                future: futureReceipt,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data!.data!.history!.length,
                      itemBuilder: (context, index) => TimelineTile(
                        indicatorStyle: IndicatorStyle(
                          indicator: Icon(
                            index == 0
                                ? CupertinoIcons.checkmark_alt_circle
                                : CupertinoIcons.circle,
                            color: index == 0
                                ? Color.fromARGB(255, 246, 142, 37)
                                : Color.fromARGB(255, 5, 78, 94),
                          ),
                          drawGap: true,
                        ),
                        afterLineStyle:
                            LineStyle(color: Color.fromARGB(255, 5, 78, 94)),
                        beforeLineStyle:
                            LineStyle(color: Color.fromARGB(255, 5, 78, 94)),
                        alignment: TimelineAlign.manual,
                        lineXY: 0.2,
                        endChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.05),
                            border: Border.all(
                              color: index == 0
                                  ? Color.fromARGB(255, 246, 142, 37)
                                  : Color.fromARGB(255, 5, 78, 94),
                            ),
                          ),
                          margin: EdgeInsets.all(width * 0.03),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: ListTile(
                            title: Text(
                              '${snapshot.data!.data!.history![index].desc}',
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.roboto(
                                fontSize: height * 0.017,
                                fontWeight: FontWeight.bold,
                                color: index == 0
                                    ? Color.fromARGB(255, 246, 142, 37)
                                    : Color.fromARGB(255, 5, 78, 94),
                              ),
                            ),
                            subtitle: Container(
                              margin: EdgeInsets.only(top: width * 0.014),
                              child: Text(
                                '${snapshot.data!.data!.history![index].date}',
                                style: GoogleFonts.roboto(
                                  fontSize: height * 0.015,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            '${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          InkWell(
                            child: Container(
                              width: width * 2,
                              height: height / 18,
                              margin: EdgeInsets.only(
                                top: width * 0.03,
                                left: width * 0.35,
                                right: width * 0.35,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 2, 148, 46)),
                              child: Center(
                                child: Text(
                                  'Retry',
                                  style: TextStyle(
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: () => Get.offAll(
                              () => Tracking2(
                                  receipt: widget.receipt,
                                  jk: widget.jk,
                                  svg: widget.svg),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: SizedBox(
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
                  child: SizedBox(
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
                  child: SizedBox(
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
