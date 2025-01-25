import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paketku/constant/constantVariabel.dart';
import 'package:paketku/helper/sql_helper.dart';
import 'package:paketku/view/cekOngkir.dart';
import 'package:paketku/view/dashboard.dart';
import 'package:paketku/view/lainnya.dart';
import 'package:paketku/view/tracking.dart';

List<Map<String, dynamic>> _journals = [];
String jsKirim = "";

class RiwayatTracking extends StatefulWidget {
  const RiwayatTracking({super.key});

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

    if (mounted) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    _refreshJournals();
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width * 0.05, right: width * 0.05, top: height * 0.04),
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
            Container(
              padding: EdgeInsets.only(
                right: width * 0.1,
                left: width * 0.1,
                top: width * 0.05,
              ),
              height: height * 0.8,
              width: width,
              child: _journals.isEmpty
                  ? SizedBox(
                      height: height * 0.2,
                      child: Center(
                          child: Text(
                        "Data kosong",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )),
                    )
                  : ListView.builder(
                      itemCount: _journals.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => Tracking2(
                              receipt: _journals[index]['receipt'],
                              jk: _journals[index]['jk'],
                              svg: _journals[index]['alamat'],
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(bottom: width * 0.03),
                            child: Row(
                              children: [
                                Container(
                                  width: width * 0.7,
                                  height: width * 0.15,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withAlpha(128),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 4), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(width * 0.04),
                                      bottomLeft: Radius.circular(width * 0.04),
                                    ),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Text(
                                        "${index + 1}",
                                        style: GoogleFonts.roboto(
                                          color: Color.fromARGB(255, 5, 78, 94),
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: SvgPicture.asset(
                                          _journals[index]['alamat'],
                                          width: width * 0.02,
                                          height: width * 0.05,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.copy,
                                                size: width * 0.03,
                                                color:
                                                    Colors.black.withAlpha(128),
                                              ),
                                              SizedBox(
                                                width: width * 0.008,
                                              ),
                                              SizedBox(
                                                width: width * 0.2,
                                                child: Text(
                                                  _journals[index]['receipt'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    color: Color.fromARGB(
                                                        255, 246, 142, 37),
                                                    fontSize: height * 0.018,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: width * 0.2,
                                            child: Text(
                                              _journals[index]['namaSVG'],
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                color:
                                                    Colors.black.withAlpha(128),
                                                fontSize: height * 0.018,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: width * 0.1,
                                    height: width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.only(
                                        topRight: Radius.circular(width * 0.04),
                                        bottomRight:
                                            Radius.circular(width * 0.04),
                                      ),
                                      color: Color.fromARGB(255, 246, 142, 37),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _deleteItem(_journals[index]['id']);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
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
