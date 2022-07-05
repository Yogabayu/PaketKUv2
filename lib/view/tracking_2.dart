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
  const Tracking2({
    Key? key,
  }) : super(key: key);

  @override
  _Tracking2State createState() => _Tracking2State();
}

class _Tracking2State extends State<Tracking2> {
  final controller = Get.put(TrackingController());
  // late Future<Receipt> futureReceipt;

  @override
  void initState() {
    super.initState();
    // futureReceipt = controller.fetchData("${widget.receipt}", "${widget.jk}");
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
      // child: Scaffold(
      //   body: Container(
      //     child: ListView(
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(
      //               left: width * 0.05,
      //               right: width * 0.05,
      //               top: height * 0.04),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               GestureDetector(
      //                 onTap: () => {
      //                   Get.offAll(
      //                     () => Dashboard(),
      //                     transition: Transition.fade,
      //                     duration: Duration(seconds: 1),
      //                   ),
      //                 },
      //                 child: Icon(
      //                   Icons.arrow_back_rounded,
      //                   size: height * 0.03,
      //                 ),
      //               ),
      //               Text(
      //                 "Tracking",
      //                 style: GoogleFonts.raleway(
      //                   fontSize: height * 0.025,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Text(""),
      //             ],
      //           ),
      //         ),
      //         FutureBuilder<Receipt>(
      //           future: futureReceipt,
      //           builder: (context, snapshot) {
      //             if (snapshot.hasData) {
      //               return Container(
      //                 width: width,
      //                 height: width * 0.5,
      //                 padding: EdgeInsets.all(width * 0.06),
      //                 margin: EdgeInsets.only(
      //                   left: width * 0.05,
      //                   right: width * 0.05,
      //                   top: height * 0.04,
      //                 ),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(width * 0.12),
      //                   color: Color.fromARGB(255, 4, 120, 122),
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         Container(
      //                           width: width * 0.7,
      //                           child: Row(
      //                             children: [
      //                               Text(
      //                                 "${snapshot.data!.data!.summary!.awb}",
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: width * 0.05,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                               Text(
      //                                 " (${snapshot.data!.data!.summary!.courier})",
      //                                 overflow: TextOverflow.ellipsis,
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: width * 0.03,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Icon(
      //                           Icons.bookmarks_outlined,
      //                           size: height * 0.03,
      //                           color: Colors.white,
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: width * 0.04,
      //                     ),
      //                     Divider(
      //                       color: Colors.white,
      //                       thickness: 1.0,
      //                     ),
      //                     SizedBox(
      //                       height: height * 0.03,
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Column(
      //                           children: [
      //                             Container(
      //                               width: width * 0.3,
      //                               child: Text(
      //                                 "Asal",
      //                                 overflow: TextOverflow.ellipsis,
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: height * 0.017,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               height: height * 0.01,
      //                             ),
      //                             Container(
      //                               width: width * 0.3,
      //                               height: width * 0.1,
      //                               child: Text(
      //                                 snapshot.data!.data!.detail!.origin == ""
      //                                     ? "******"
      //                                     : "${snapshot.data!.data!.detail!.origin}",
      //                                 overflow: TextOverflow.visible,
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: height * 0.017,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Icon(
      //                           Icons.arrow_forward,
      //                           size: height * 0.03,
      //                           color: Colors.white,
      //                         ),
      //                         Column(
      //                           children: [
      //                             Container(
      //                               width: width * 0.3,
      //                               child: Text(
      //                                 "Tujuan",
      //                                 overflow: TextOverflow.ellipsis,
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: height * 0.017,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               height: height * 0.01,
      //                             ),
      //                             Container(
      //                               width: width * 0.3,
      //                               height: width * 0.1,
      //                               child: Text(
      //                                 snapshot.data!.data!.detail!
      //                                             .destination ==
      //                                         ""
      //                                     ? "******"
      //                                     : "${snapshot.data!.data!.detail!.destination}",
      //                                 overflow: TextOverflow.visible,
      //                                 // overflow: TextOverflow.ellipsis,
      //                                 style: GoogleFonts.raleway(
      //                                   fontSize: height * 0.017,
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             } else if (snapshot.hasError) {
      //               return Center(
      //                 child: Container(
      //                   width: width,
      //                   height: width * 0.5,
      //                   margin: EdgeInsets.only(top: 20),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         child: Text(
      //                           '${snapshot.error}',
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               fontSize: 18, color: Colors.black),
      //                         ),
      //                         margin: EdgeInsets.all(20),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             }
      //             return Container(
      //               width: width,
      //               height: width * 0.5,
      //               child: Center(
      //                 child: CircularProgressIndicator(),
      //               ),
      //             );
      //           },
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(
      //               left: width * 0.05,
      //               right: width * 0.05,
      //               top: height * 0.05,
      //               bottom: height * 0.03),
      //           child: Text(
      //             "Status Paket",
      //             style: GoogleFonts.raleway(
      //               fontSize: height * 0.022,
      //               color: Colors.black,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         FutureBuilder<Receipt>(
      //           future: futureReceipt,
      //           builder: (context, snapshot) {
      //             if (snapshot.hasData) {
      //               return Container(
      //                 width: width,
      //                 height: width * 0.9,
      //                 child: ListView.builder(
      //                   shrinkWrap: true,
      //                   itemCount: snapshot.data!.data!.history!.length,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     if (index % 2 == 0) {
      //                       return Container(
      //                         margin: EdgeInsets.only(
      //                           left: width * 0.03,
      //                           right: width * 0.03,
      //                         ),
      //                         child: TimelineTile(
      //                           alignment: TimelineAlign.manual,
      //                           lineXY: 0.3,
      //                           endChild: Container(
      //                             decoration: BoxDecoration(
      //                               borderRadius:
      //                                   BorderRadius.circular(width * 0.05),
      //                               color: Color.fromARGB(255, 4, 120, 122)
      //                                   .withOpacity(0.2),
      //                             ),
      //                             margin: EdgeInsets.all(width * 0.06),
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: 20, vertical: 20),
      //                             constraints: const BoxConstraints(
      //                               minHeight: 120,
      //                             ),
      //                             child: ListTile(
      //                               title: Container(
      //                                 width: width * 0.05,
      //                                 child: Text(
      //                                   '${snapshot.data!.data!.history![index].desc}',
      //                                   overflow: TextOverflow.fade,
      //                                   style: GoogleFonts.raleway(
      //                                     fontSize: height * 0.017,
      //                                     fontWeight: FontWeight.bold,
      //                                     color: Colors.black,
      //                                   ),
      //                                 ),
      //                               ),
      //                               subtitle: Container(
      //                                 margin:
      //                                     EdgeInsets.only(top: width * 0.014),
      //                                 child: Text(
      //                                   '${snapshot.data!.data!.history![index].date}',
      //                                   style: GoogleFonts.raleway(
      //                                     fontSize: height * 0.015,
      //                                     color: Colors.black,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                           startChild: Container(
      //                             child: Icon(
      //                               CupertinoIcons.cart,
      //                               size: 20,
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     } else {
      //                       return Container(
      //                         margin: EdgeInsets.only(
      //                           left: width * 0.03,
      //                           right: width * 0.03,
      //                         ),
      //                         child: TimelineTile(
      //                           alignment: TimelineAlign.manual,
      //                           lineXY: 0.3,
      //                           endChild: Container(
      //                             decoration: BoxDecoration(
      //                               borderRadius:
      //                                   BorderRadius.circular(width * 0.05),
      //                               color: Color.fromARGB(255, 4, 120, 122)
      //                                   .withOpacity(0.2),
      //                             ),
      //                             margin: EdgeInsets.all(width * 0.06),
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: 20, vertical: 20),
      //                             constraints: const BoxConstraints(
      //                               minHeight: 120,
      //                             ),
      //                             child: ListTile(
      //                               title: Container(
      //                                 width: width * 0.05,
      //                                 child: Text(
      //                                   '${snapshot.data!.data!.history![index].desc}',
      //                                   overflow: TextOverflow.fade,
      //                                   style: GoogleFonts.raleway(
      //                                     fontSize: height * 0.017,
      //                                     fontWeight: FontWeight.bold,
      //                                     color: Colors.black,
      //                                   ),
      //                                 ),
      //                               ),
      //                               subtitle: Container(
      //                                 margin:
      //                                     EdgeInsets.only(top: width * 0.014),
      //                                 child: Text(
      //                                   '${snapshot.data!.data!.history![index].date}',
      //                                   style: GoogleFonts.raleway(
      //                                     fontSize: height * 0.015,
      //                                     color: Colors.black,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                           startChild: Container(
      //                             child: Icon(
      //                               CupertinoIcons.cart,
      //                               size: 20,
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     }
      //                   },
      //                 ),
      //               );
      //             } else if (snapshot.hasError) {
      //               return Center(
      //                 child: Container(
      //                   height: height * 0.5,
      //                   margin: EdgeInsets.only(top: 20),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Container(
      //                         child: Text(
      //                           '${snapshot.error}',
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               fontSize: 18, color: Colors.black),
      //                         ),
      //                         margin: EdgeInsets.all(20),
      //                       ),
      //                       InkWell(
      //                         child: Container(
      //                             width: width * 2,
      //                             height: height / 18,
      //                             margin: EdgeInsets.only(
      //                               top: width * 0.03,
      //                               left: width * 0.35,
      //                               right: width * 0.35,
      //                             ),
      //                             decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(20),
      //                                 color: Color.fromARGB(255, 2, 148, 46)),
      //                             child: Center(
      //                                 child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: <Widget>[
      //                                 Text(
      //                                   'Retry',
      //                                   style: TextStyle(
      //                                       fontSize: height * 0.02,
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Colors.white),
      //                                 ),
      //                               ],
      //                             ))),
      //                         onTap: () => {
      //                           Get.offAll(
      //                             () => Tracking(
      //                                 receipt: "${widget.receipt}",
      //                                 jk: "${widget.jk}"),
      //                             transition: Transition.fade,
      //                             duration: Duration(seconds: 1),
      //                           )
      //                         },
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             }
      //             return Center(
      //               child: Container(
      //                 margin: EdgeInsets.all(
      //                   height * 0.2,
      //                 ),
      //                 child: CircularProgressIndicator(),
      //               ),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
              // wordSpacing: 5,
              // letterSpacing: 2,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              print("object");
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
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
                      child: SvgPicture.asset("assets/logo/sicepat.svg"),
                    ),
                    SizedBox(
                      height: width * 0.01,
                    ),
                    Text(
                      "( " + "JNE - REG" + ")",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 14, 7, 1).withOpacity(0.4),
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
                            "IDxxxxxxss sssss",
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
              ),
              Divider(
                thickness: 5,
                color: Colors.black.withOpacity(0.1),
              ),
              Container(
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
                          "Jakarta",
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
                          "Sedang diProses",
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
                          "Ponorogo",
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
