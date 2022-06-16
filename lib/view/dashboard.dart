import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/controller/tracking_controller.dart';
import 'package:tracking/view/cekOngkir.dart';
import 'package:tracking/view/riwayatTracking.dart';
import 'package:tracking/view/tracking.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final trackController = Get.put(TrackingController());
  // String dropdownvalue = '--';
  DateTime? lastPressed;
  bool isLoading = true;

  void gagal() {
    Get.snackbar(
      "Pencarian Anda tidak ditemukan",
      "Silahkan isi semua kolom terlebih dahulu",
      icon: Icon(Icons.block_outlined, color: Colors.red),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(255, 4, 120, 122),
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                FadeInDown(
                  delay: const Duration(milliseconds: 100),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height / 1.7,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(width * 0.1),
                        bottomRight: Radius.circular(width * 0.1),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/dashboard_bg4.jpg'),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(width * 0.1),
                          bottomRight: Radius.circular(width * 0.1),
                        ),
                        color:
                            Color.fromARGB(255, 205, 236, 237).withOpacity(0.8),
                      ),
                      child: FadeInDown(
                        delay: const Duration(milliseconds: 150),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                                top: height * 0.04,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Lokasi Anda",
                                        style: GoogleFonts.raleway(
                                          fontSize: height * 0.02,
                                          color:
                                              Color.fromARGB(255, 4, 120, 122),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Ponorogo",
                                        style: GoogleFonts.raleway(
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 4, 120, 122),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(""),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.13,
                            ),
                            Text(
                              "Lacak Paket Anda",
                              style: GoogleFonts.raleway(
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 4, 120, 122),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              "Masukkan no resi anda",
                              style: GoogleFonts.raleway(
                                fontSize: height * 0.02,
                                color: Color.fromARGB(255, 2, 84, 86),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      Radius.circular(width * 0.05),
                                    ),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  width: width * 0.6,
                                  height: height * 0.05,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    style: GoogleFonts.raleway(
                                      color: Color.fromARGB(255, 2, 84, 86),
                                    ),
                                    controller: trackController.receipt,
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan nomor resi disini",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(width * 0.1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(width * 0.1),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.2,
                                  height: height / 18,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    style: GoogleFonts.raleway(
                                        color: Color.fromARGB(255, 2, 84, 86),
                                        fontWeight: FontWeight.bold),
                                    value: trackController.dropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: trackController.items
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        trackController.dropdownvalue =
                                            newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                width: width / 2,
                                height: height / 18,
                                margin: EdgeInsets.all(width * 0.07),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1),
                                  color: Color.fromARGB(255, 4, 120, 122),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          if (trackController
                                              .receipt.text.isEmpty) {
                                            gagal();
                                          } else {
                                            Get.offAll(
                                              () => Tracking(
                                                receipt: trackController
                                                    .receipt.text,
                                                jk: trackController
                                                    .dropdownvalue,
                                              ),
                                              transition: Transition.fade,
                                              duration: Duration(seconds: 1),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Lacak Sekarang',
                                          style: GoogleFonts.raleway(
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 205, 236, 237),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.06,
              ),
              width: width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: width * 0.06,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Menu Lainnya',
                          style: GoogleFonts.raleway(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // Text(
                        //   'lihat semua',
                        //   style: GoogleFonts.raleway(
                        //     fontSize: height * 0.014,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.black.withOpacity(0.5),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: width * 0.06,
                    ),
                    width: width,
                    height: width * 0.5,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(width * 0.055),
                            margin: EdgeInsets.only(
                                right: width * 0.06, top: width * 0.06),
                            width: width * 0.5,
                            height: width * 0.4,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                Radius.circular(width * 0.1),
                              ),
                              border: Border.all(
                                color: Color.fromARGB(255, 4, 120, 122)
                                    .withOpacity(0.3),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.09,
                                  height: width * 0.09,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      Radius.circular(width * 0.1),
                                    ),
                                    color: Color.fromARGB(255, 4, 120, 122)
                                        .withOpacity(0.2),
                                  ),
                                  child: Icon(
                                    Icons.calculate,
                                    color: Color.fromARGB(255, 4, 120, 122)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: width * 0.05,
                                ),
                                Container(
                                  child: Text(
                                    'Hitung Ongkos Kirim Paket Anda',
                                    style: GoogleFonts.raleway(
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.offAll(
                              () => CekOngkir(),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(
                              () => RiwayatTracking(),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(width * 0.055),
                            margin: EdgeInsets.only(
                                right: width * 0.06, top: width * 0.06),
                            width: width * 0.5,
                            height: width * 0.4,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                Radius.circular(width * 0.1),
                              ),
                              border: Border.all(
                                color: Color.fromARGB(255, 4, 120, 122)
                                    .withOpacity(0.3),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.09,
                                  height: width * 0.09,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      Radius.circular(width * 0.1),
                                    ),
                                    color: Color.fromARGB(255, 4, 120, 122)
                                        .withOpacity(0.2),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 4, 120, 122)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: width * 0.05,
                                ),
                                Container(
                                  child: Text(
                                    'Riwayat Pelacakan',
                                    style: GoogleFonts.raleway(
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
