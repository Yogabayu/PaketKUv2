import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:google_fonts/google_fonts.dart';

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
          ],
        ),
      ),
    );
  }
}
