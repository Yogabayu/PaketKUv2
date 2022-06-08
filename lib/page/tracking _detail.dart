import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:tracking/constants/constant.dart';
import 'package:tracking/controller/tracking_controller.dart';
import 'package:tracking/model/receipt.dart';

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
  final controller = Get.put(TrackingController());
  late Future<Receipt> futureReceipt;
  @override
  void initState() {
    super.initState();
    futureReceipt = controller.fetchData("${widget.jk}", "${widget.receipt}");
  }

  void gagal() {
    Get.snackbar(
      "Pencarian Anda tidak ditemukan",
      "Silahkan isi semua kolom terlebih dahulu",
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
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      "${widget.receipt}",
                      style: GoogleFonts.lato(
                        fontSize: height * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Jasa Kirim : " + controller.jKirim,
                      style: GoogleFonts.lato(
                        fontSize: height * 0.02,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<Receipt>(
              future: futureReceipt,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: width * 0.03,
                    ),
                    height: height * 0.7,
                    width: width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.history!.length,
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
                              child: ListTile(
                                title: Text(
                                    '${snapshot.data!.data!.history![index].desc}'),
                                subtitle: Text(
                                    '${snapshot.data!.data!.history![index].date}'),
                              ),
                            ),
                            startChild: Container(
                              child: Icon(
                                CupertinoIcons.cart_fill,
                                size: 20,
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
                              child: ListTile(
                                title: Text(
                                    '${snapshot.data!.data!.history![index].desc}'),
                                subtitle: Text(
                                    '${snapshot.data!.data!.history![index].date}'),
                              ),
                            ),
                            startChild: Container(
                              child: Icon(
                                CupertinoIcons.cart,
                                size: 20,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                  // return Text(snapshot.data!.detail);
                } else if (snapshot.hasError) {
                  // return displaySnackBar('${snapshot.error}');
                  // gagal();
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   Scaffold.of(context)
                  //     ..gagal();
                  // });
                  // return Container();

                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Center(
                    child: Container(
                  margin: EdgeInsets.all(
                    height * 0.2,
                  ),
                  child: CircularProgressIndicator(),
                ));
              },
            )
            // ?
          ],
        ),
      ),
    );
  }
}
