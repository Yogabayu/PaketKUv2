import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tracking/constant/constantVariabel.dart';
import 'package:tracking/controller/tracking_controller.dart';
import 'package:tracking/model/receipt.dart';
import 'package:tracking/view/dashboard.dart';

class Tracking2 extends StatefulWidget {
  String receipt;
  String jk;
  String svg;
  Tracking2({
    Key? key,
    required this.receipt,
    required this.jk,
    required this.svg,
  }) : super(key: key);

  @override
  _Tracking2State createState() => _Tracking2State();
}

class _Tracking2State extends State<Tracking2> {
  final controller = Get.put(TrackingController());
  late Future<Receipt> futureReceipt;

  @override
  void initState() {
    super.initState();
    futureReceipt = controller.fetchData("${widget.receipt}", "${widget.jk}");
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 55, 202, 236),
          child: Icon(Icons.home),
          onPressed: () {},
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
        body: Container(
          child: ListView(
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
                              color: Color.fromARGB(255, 14, 7, 1)
                                  .withOpacity(0.4),
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
                    return Center(
                      child: Container(
                        width: width,
                        height: width * 0.5,
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '${snapshot.error}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              margin: EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: width,
                      height: width * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              Divider(
                thickness: 5,
                color: Colors.black.withOpacity(0.1),
              ),
              FutureBuilder<Receipt>(
                future: futureReceipt,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.all(width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Kota Asal",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 5, 78, 94),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data!.data!.detail!.origin == ""
                                    ? "*****"
                                    : "${snapshot.data!.data!.detail!.origin}",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 246, 142, 37),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Status",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 5, 78, 94),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data!.data!.summary!.status == ""
                                    ? "Sedang di Proses"
                                    : "${snapshot.data!.data!.summary!.status}",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 246, 142, 37),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Kota Tujuan",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 5, 78, 94),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data!.data!.detail!.destination == ""
                                    ? "*****"
                                    : "${snapshot.data!.data!.detail!.destination}",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 246, 142, 37),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '${snapshot.error}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              margin: EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: width,
                      height: width * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              Divider(
                thickness: 5,
                color: Colors.black.withOpacity(0.1),
              ),
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
              Container(
                width: width,
                height: width * 0.8,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 4 - 1) {
                      return Container(
                        child: TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            indicator: Icon(
                              CupertinoIcons.checkmark_alt_circle,
                              color: Color.fromARGB(255, 246, 142, 37),
                            ),
                            drawGap: true,
                          ),
                          afterLineStyle: LineStyle(
                            color: Color.fromARGB(255, 5, 78, 94),
                          ),
                          beforeLineStyle: LineStyle(
                            color: Color.fromARGB(255, 5, 78, 94),
                          ),
                          alignment: TimelineAlign.manual,
                          lineXY: 0.2,
                          endChild: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.05),
                              border: Border.all(
                                color: Color.fromARGB(255, 246, 142, 37),
                              ),
                            ),
                            margin: EdgeInsets.all(width * 0.03),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: ListTile(
                              title: Container(
                                width: width * 0.01,
                                child: Text(
                                  'Telah Berangkat : Gudang Transit Jakarta',
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.roboto(
                                    fontSize: height * 0.017,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 246, 142, 37),
                                  ),
                                ),
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: width * 0.014),
                                child: Text(
                                  '2022-12-12 12:12:12',
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
                    } else {
                      return Container(
                        child: TimelineTile(
                          indicatorStyle: IndicatorStyle(
                            indicator: Icon(
                              CupertinoIcons.circle,
                              color: Color.fromARGB(255, 5, 78, 94),
                            ),
                            drawGap: true,
                          ),
                          afterLineStyle: LineStyle(
                            color: Color.fromARGB(255, 5, 78, 94),
                          ),
                          beforeLineStyle: LineStyle(
                            color: Color.fromARGB(255, 5, 78, 94),
                          ),
                          alignment: TimelineAlign.manual,
                          lineXY: 0.2,
                          endChild: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.05),
                              border: Border.all(
                                color: Color.fromARGB(255, 5, 78, 94),
                              ),
                            ),
                            margin: EdgeInsets.all(width * 0.03),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: ListTile(
                              title: Container(
                                width: width * 0.01,
                                child: Text(
                                  'Telah Berangkat : Gudang Transit Jakarta',
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.roboto(
                                    fontSize: height * 0.017,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 78, 94),
                                  ),
                                ),
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: width * 0.014),
                                child: Text(
                                  '2022-12-12 12:12:12',
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
                    }
                  },
                ),
              ),
            ],
          ),
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
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.price_change_outlined,
                      ),
                      Text(
                        'Cek Ongkir',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dehaze_sharp,
                      ),
                      Text(
                        'Lainnya',
                        style: TextStyle(),
                      ),
                    ],
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
