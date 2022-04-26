import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingDetail extends StatefulWidget {
  const TrackingDetail({
    Key? key,
    required this.receipt,
    required this.jk,
  }) : super(key: key);

  final String receipt;
  final String jk;
  @override
  _TrackingDetailState createState() => _TrackingDetailState();
}

class _TrackingDetailState extends State<TrackingDetail> {
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
                      "Jasa Kirim : ${widget.jk}",
                      style: GoogleFonts.lato(
                        fontSize: height * 0.02,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: width * 0.03,
              ),
              height: height,
              width: width,
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 2 == 0) {
                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        endChild: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          constraints: const BoxConstraints(
                            minHeight: 120,
                          ),
                          // color: Colors.amber,
                          child: ListTile(
                            title: Text("data"),
                            subtitle: Text("data"),
                          ),
                          // color: Colors.lightGreenAccent,
                        ),
                        startChild: Container(
                          // color: Colors.amberAccent,
                          child: Icon(
                            CupertinoIcons.cart_badge_plus,
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
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          constraints: const BoxConstraints(
                            minHeight: 120,
                          ),
                          // color: Colors.amber,
                          child: ListTile(
                            title: Text("data1"),
                            subtitle: Text("data"),
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
            ),
          ],
        ),
      ),
    );
  }
}
