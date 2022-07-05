// ignore_for_file: unused_local_variable, must_be_immutable, unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/controller/tracking_controller.dart';
import 'package:tracking/model/dummy_data_ikon.dart';
import 'package:tracking/view/cekOngkir.dart';
// import 'package:tracking/view/riwayatTracking.dart';
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
  Position? _currentPosition;
  static double _minHeight = 0, _maxHeight = 500;
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;
  int selectedCard = -1;
  String _jkPilih = '';
  String? _currentAddress;
  int menu = 1;

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
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? _iconjk;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // return Scaffold(
    //   body: Container(
    //     child: ListView(
    //       children: [
    //         Stack(
    //           children: [
    //             FadeInDown(
    //               delay: const Duration(milliseconds: 100),
    //               child: Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 height: height / 1.7,
    //                 decoration: new BoxDecoration(
    //                   borderRadius: new BorderRadius.only(
    //                     bottomLeft: Radius.circular(width * 0.1),
    //                     bottomRight: Radius.circular(width * 0.1),
    //                   ),
    //                   image: DecorationImage(
    //                     fit: BoxFit.cover,
    //                     image: AssetImage('assets/dashboard_bg4.jpg'),
    //                   ),
    //                 ),
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: new BorderRadius.only(
    //                       bottomLeft: Radius.circular(width * 0.1),
    //                       bottomRight: Radius.circular(width * 0.1),
    //                     ),
    //                     color:
    //                         Color.fromARGB(255, 205, 236, 237).withOpacity(0.8),
    //                   ),
    //                   child: FadeInDown(
    //                     delay: const Duration(milliseconds: 150),
    //                     child: Column(
    //                       children: [
    //                         // Container(
    //                         //   margin: EdgeInsets.only(
    //                         //     left: width * 0.05,
    //                         //     right: width * 0.05,
    //                         //     top: height * 0.04,
    //                         //   ),
    //                         //   child: Row(
    //                         //     mainAxisAlignment:
    //                         //         MainAxisAlignment.spaceBetween,
    //                         //     children: [
    //                         //       Text(""),
    //                         //       Column(
    //                         //         crossAxisAlignment:
    //                         //             CrossAxisAlignment.center,
    //                         //         mainAxisAlignment: MainAxisAlignment.center,
    //                         //         children: [
    //                         //           Text(
    //                         //             "Lokasi Anda",
    //                         //             style: GoogleFonts.raleway(
    //                         //               fontSize: height * 0.02,
    //                         //               color:
    //                         //                   Color.fromARGB(255, 4, 120, 122),
    //                         //             ),
    //                         //           ),
    //                         //           SizedBox(
    //                         //             height: 5,
    //                         //           ),
    //                         //           if (_currentPosition != null &&
    //                         //               _currentAddress != null)
    //                         //             Text(
    //                         //               _currentAddress!,
    //                         //               style: GoogleFonts.raleway(
    //                         //                 fontSize: height * 0.02,
    //                         //                 fontWeight: FontWeight.bold,
    //                         //                 color: Color.fromARGB(
    //                         //                     255, 4, 120, 122),
    //                         //               ),
    //                         //             ),
    //                         //         ],
    //                         //       ),
    //                         //       Text(""),
    //                         //     ],
    //                         //   ),
    //                         // ),
    //                         SizedBox(
    //                           height: height * 0.05,
    //                         ),
    //                         Text(
    //                           "LACAK PAKET",
    //                           style: GoogleFonts.roboto(
    //                             fontSize: height * 0.04,
    //                             fontWeight: FontWeight.w600,
    //                             color: Color.fromARGB(255, 4, 120, 122),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: height * 0.02,
    //                         ),
    //                         Text(
    //                           "Masukkan no resi anda",
    //                           style: GoogleFonts.raleway(
    //                             fontSize: height * 0.02,
    //                             color: Color.fromARGB(255, 2, 84, 86),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: height * 0.02,
    //                         ),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                           children: [
    //                             Container(
    //                               decoration: BoxDecoration(
    //                                 borderRadius: new BorderRadius.all(
    //                                   Radius.circular(width * 0.05),
    //                                 ),
    //                                 color: Colors.white.withOpacity(0.5),
    //                               ),
    //                               width: width * 0.6,
    //                               height: height * 0.05,
    //                               child: TextField(
    //                                 textAlignVertical: TextAlignVertical.bottom,
    //                                 style: GoogleFonts.raleway(
    //                                   color: Color.fromARGB(255, 2, 84, 86),
    //                                 ),
    //                                 controller: trackController.receipt,
    //                                 textAlign: TextAlign.start,
    //                                 decoration: InputDecoration(
    //                                   hintText: "Masukkan nomor resi disini",
    //                                   enabledBorder: OutlineInputBorder(
    //                                     borderSide: BorderSide(
    //                                       color: Colors.white.withOpacity(0.5),
    //                                     ),
    //                                     borderRadius:
    //                                         BorderRadius.circular(width * 0.1),
    //                                   ),
    //                                   focusedBorder: OutlineInputBorder(
    //                                     borderSide: BorderSide(
    //                                       color: Colors.white.withOpacity(0.5),
    //                                     ),
    //                                     borderRadius:
    //                                         BorderRadius.circular(width * 0.1),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             Container(
    //                               width: width * 0.2,
    //                               height: height / 18,
    //                               child: DropdownButton(
    //                                 isExpanded: true,
    //                                 style: GoogleFonts.raleway(
    //                                     color: Color.fromARGB(255, 2, 84, 86),
    //                                     fontWeight: FontWeight.bold),
    //                                 value: trackController.dropdownvalue,
    //                                 icon: const Icon(Icons.keyboard_arrow_down),
    //                                 items: trackController.items
    //                                     .map((String items) {
    //                                   return DropdownMenuItem(
    //                                     value: items,
    //                                     child: Text(items),
    //                                   );
    //                                 }).toList(),
    //                                 onChanged: (String? newValue) {
    //                                   setState(() {
    //                                     trackController.dropdownvalue =
    //                                         newValue!;
    //                                   });
    //                                 },
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                         Center(
    //                           child: Container(
    //                             width: width / 2,
    //                             height: height / 18,
    //                             margin: EdgeInsets.all(width * 0.07),
    //                             decoration: BoxDecoration(
    //                               borderRadius:
    //                                   BorderRadius.circular(width * 0.1),
    //                               color: Color.fromARGB(255, 4, 120, 122),
    //                             ),
    //                             child: Center(
    //                               child: Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceEvenly,
    //                                 children: <Widget>[
    //                                   InkWell(
    //                                     onTap: () {
    //                                       if (trackController
    //                                           .receipt.text.isEmpty) {
    //                                         gagal();
    //                                       } else {
    //                                         Get.offAll(
    //                                           () => Tracking(
    //                                             receipt: trackController
    //                                                 .receipt.text,
    //                                             jk: trackController
    //                                                 .dropdownvalue,
    //                                           ),
    //                                           transition: Transition.fade,
    //                                           duration: Duration(seconds: 1),
    //                                         );
    //                                       }
    //                                     },
    //                                     child: Text(
    //                                       'Lacak Sekarang',
    //                                       style: GoogleFonts.raleway(
    //                                         fontSize: height * 0.02,
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Color.fromARGB(
    //                                             255, 205, 236, 237),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: height * 0.03,
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(
    //             left: width * 0.06,
    //           ),
    //           width: width,
    //           child: Column(
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(
    //                   right: width * 0.06,
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       'Menu Lainnya',
    //                       style: GoogleFonts.raleway(
    //                         fontSize: height * 0.025,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black,
    //                       ),
    //                     ),
    //                     // Text(
    //                     //   'lihat semua',
    //                     //   style: GoogleFonts.raleway(
    //                     //     fontSize: height * 0.014,
    //                     //     fontWeight: FontWeight.bold,
    //                     //     color: Colors.black.withOpacity(0.5),
    //                     //   ),
    //                     // ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only(
    //                   right: width * 0.06,
    //                 ),
    //                 width: width,
    //                 height: width * 0.5,
    //                 child: ListView(
    //                   shrinkWrap: true,
    //                   scrollDirection: Axis.horizontal,
    //                   children: [
    //                     GestureDetector(
    //                       child: Container(
    //                         padding: EdgeInsets.all(width * 0.055),
    //                         margin: EdgeInsets.only(
    //                             right: width * 0.06, top: width * 0.06),
    //                         width: width * 0.5,
    //                         height: width * 0.4,
    //                         decoration: new BoxDecoration(
    //                           borderRadius: new BorderRadius.all(
    //                             Radius.circular(width * 0.1),
    //                           ),
    //                           border: Border.all(
    //                             color: Color.fromARGB(255, 4, 120, 122)
    //                                 .withOpacity(0.3),
    //                           ),
    //                           color: Colors.white,
    //                         ),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Container(
    //                               width: width * 0.09,
    //                               height: width * 0.09,
    //                               decoration: new BoxDecoration(
    //                                 borderRadius: new BorderRadius.all(
    //                                   Radius.circular(width * 0.1),
    //                                 ),
    //                                 color: Color.fromARGB(255, 4, 120, 122)
    //                                     .withOpacity(0.2),
    //                               ),
    //                               child: Icon(
    //                                 Icons.calculate,
    //                                 color: Color.fromARGB(255, 4, 120, 122)
    //                                     .withOpacity(0.8),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: width * 0.05,
    //                             ),
    //                             Container(
    //                               child: Text(
    //                                 'Hitung Ongkos Kirim Paket Anda',
    //                                 style: GoogleFonts.raleway(
    //                                   fontSize: height * 0.02,
    //                                   fontWeight: FontWeight.bold,
    //                                   color: Colors.black.withOpacity(0.5),
    //                                 ),
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                       onTap: () {
    //                         Get.offAll(
    //                           () => CekOngkir(),
    //                           transition: Transition.fade,
    //                           duration: Duration(seconds: 1),
    //                         );
    //                       },
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         Get.offAll(
    //                           () => RiwayatTracking(),
    //                           transition: Transition.fade,
    //                           duration: Duration(seconds: 1),
    //                         );
    //                       },
    //                       child: Container(
    //                         padding: EdgeInsets.all(width * 0.055),
    //                         margin: EdgeInsets.only(
    //                             right: width * 0.06, top: width * 0.06),
    //                         width: width * 0.5,
    //                         height: width * 0.4,
    //                         decoration: new BoxDecoration(
    //                           borderRadius: new BorderRadius.all(
    //                             Radius.circular(width * 0.1),
    //                           ),
    //                           border: Border.all(
    //                             color: Color.fromARGB(255, 4, 120, 122)
    //                                 .withOpacity(0.3),
    //                           ),
    //                           color: Colors.white,
    //                         ),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Container(
    //                               width: width * 0.09,
    //                               height: width * 0.09,
    //                               decoration: new BoxDecoration(
    //                                 borderRadius: new BorderRadius.all(
    //                                   Radius.circular(width * 0.1),
    //                                 ),
    //                                 color: Color.fromARGB(255, 4, 120, 122)
    //                                     .withOpacity(0.2),
    //                               ),
    //                               child: Icon(
    //                                 Icons.search,
    //                                 color: Color.fromARGB(255, 4, 120, 122)
    //                                     .withOpacity(0.8),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: width * 0.05,
    //                             ),
    //                             Container(
    //                               child: Text(
    //                                 'Riwayat Pelacakan',
    //                                 style: GoogleFonts.raleway(
    //                                   fontSize: height * 0.02,
    //                                   fontWeight: FontWeight.bold,
    //                                   color: Colors.black.withOpacity(0.5),
    //                                 ),
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 55, 202, 236),
        child: Icon(Icons.home),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/dashboard_bg4.jpg'),
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: width * 0.05, right: width * 0.05, left: width * 0.05),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 198, 197, 197).withOpacity(0.8),
              ),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "LACAK PAKET",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                    child: Text(
                      "Lokasi Anda",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.02,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  if (_currentPosition != null && _currentAddress != null)
                    Center(
                      child: Text(
                        _currentAddress!,
                        style: GoogleFonts.roboto(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                    child: Text(
                      "Masukkan No. Resi Anda",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 5, 78, 94),
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 246, 142, 37),
                        ),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        color: Colors.white,
                      ),
                      width: width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 246, 142, 37),
                          ),
                          Container(
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Center(
                    child: Text(
                      "Pilih Jasa Kirim",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 5, 78, 94),
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 246, 142, 37),
                        ),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        color: Colors.white,
                      ),
                      width: width * 0.6,
                      height: height * 0.05,
                      child: GestureDetector(
                        onTap: _handleClick,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 246, 142, 37),
                            ),
                            Container(
                              width: width * 0.35,
                              child: Center(
                                child: Obx(
                                  () => SvgPicture.asset(
                                    trackController.namaSVG.value == ''
                                        ? ''
                                        : trackController.namaSVG.value,
                                    width: width * 0.02,
                                    height: width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 246, 142, 37),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 246, 142, 37),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (trackController.receipt.text.isEmpty) {
                            gagal();
                          } else {
                            Get.offAll(
                              () => Tracking(
                                receipt: trackController.receipt.text,
                                jk: trackController.dropdownvalue,
                              ),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1),
                            );
                          }
                        },
                        child: Text(
                          "Cari",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.all(width * 0.05),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 42, 172, 213),
                      ),
                      borderRadius: new BorderRadius.all(
                        Radius.circular(width * 0.05),
                      ),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    width: width,
                    height: width * 0.8,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2.0,
                                      color: Colors.lightBlue.shade900),
                                ),
                              ),
                              child: Text(
                                "Riwayat Pelacakan",
                                style: GoogleFonts.roboto(
                                  color: Color.fromARGB(255, 5, 78, 94),
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "Lihat Semua >",
                              style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 246, 142, 37),
                                fontSize: height * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Container(
                          height: width * 0.55,
                          width: width,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: width * 0.03),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.7,
                                      height: width * 0.15,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(2,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: new BorderRadius.only(
                                          topLeft:
                                              Radius.circular(width * 0.04),
                                          bottomLeft:
                                              Radius.circular(width * 0.04),
                                        ),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
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
                                            "$index",
                                            style: GoogleFonts.roboto(
                                              color: Color.fromARGB(
                                                  255, 5, 78, 94),
                                              fontSize: height * 0.018,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: SvgPicture.asset(
                                              'assets/logo/shopee.svg',
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
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.008,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.2,
                                                    child: Text(
                                                      "IDxxxxxxss sssss",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        color: Color.fromARGB(
                                                            255, 246, 142, 37),
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: width * 0.2,
                                                child: Text(
                                                  "data da dad dada ad",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
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
                                            topRight:
                                                Radius.circular(width * 0.04),
                                            bottomRight:
                                                Radius.circular(width * 0.04),
                                          ),
                                          color:
                                              Color.fromARGB(255, 246, 142, 37),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            print("delete");
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
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              _offset = Offset(0, _offset.dy - details.delta.dy);
              if (_offset.dy < _DashboardState._minHeight) {
                _offset = Offset(0, _DashboardState._minHeight);
                _isOpen = false;
              } else if (_offset.dy > _DashboardState._maxHeight) {
                _offset = Offset(0, _DashboardState._maxHeight);
                _isOpen = true;
              } else {
                _isOpen = false;
              }
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10)
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  // shrinkWrap: true,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: _handleClick,
                        icon: Icon(Icons.close),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: dummySvg.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final svg = dummySvg[index];
                        return GestureDetector(
                          onTap: () {
                            trackController.gantiSvg(svg.images);
                            setState(() {
                              selectedCard = index;
                              _jkPilih = svg.title;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: selectedCard == index
                                        ? Color.fromARGB(255, 4, 210, 35)
                                        : Colors.black,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(width * 0.05),
                                  ),
                                  color: Colors.white,
                                ),
                                height: width * 0.2,
                                width: width * 0.2,
                                child: SvgPicture.asset(
                                  svg.images,
                                  width: width * 0.1,
                                  height: width * 0.1,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    svg.title,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 246, 142, 37),
                                      wordSpacing: 5,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                    transition: Transition.fade,
                    duration: Duration(seconds: 1),
                  );
                },
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
    );
  }

  // first it opens the sheet and when called again it closes.
  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_isOpen) {
        double value = _offset.dy +
            20; // we increment the height of the Container by 10 every 5ms
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset =
              Offset(0, _maxHeight); // makes sure it does't go above maxHeight
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 20; // we decrement the height by 10 here
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = Offset(
              0, _minHeight); // makes sure it doesn't go beyond minHeight
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}
