// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constant/constantVariabel.dart';
import 'package:tracking/view/cekOngkir.dart';
import 'package:tracking/view/dashboard.dart';
import 'package:tracking/widget/lainnya/bagikan_widget.dart';
import 'package:tracking/widget/lainnya/delete_widget.dart';
import 'package:tracking/widget/lainnya/email_to_widget.dart';
import 'package:tracking/widget/lainnya/rating_widget.dart';

class Lainnya extends StatefulWidget {
  const Lainnya({Key? key}) : super(key: key);

  @override
  State<Lainnya> createState() => _LainnyaState();
}

class _LainnyaState extends State<Lainnya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      floatingActionButton: FloatingActionButton(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.07),
              height: width * 0.55,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.1),
                  bottomRight: Radius.circular(width * 0.1),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.2,
                    height: width * 0.25,
                    child: Image.asset('assets/image/logo1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Developer: Yoga Dev.",
                    style: GoogleFonts.roboto(
                      fontSize: height * 0.025,
                      color: Color.fromARGB(255, 4, 120, 122),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Yoga Bayu Anggana Pratama",
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.025,
                        color: Color.fromARGB(255, 4, 120, 122),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.1,
            ),
            Container(
              padding: EdgeInsets.only(
                top: width * 0.17,
                left: width * 0.07,
                right: width * 0.07,
              ),
              height: width * 1.04,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(width * 0.1),
                  topRight: Radius.circular(width * 0.1),
                ),
              ),
              child: Column(
                children: [
                  DeleteAllWidget(
                    namaIcon: Icons.delete_forever_outlined,
                    isiText: "Bersihkan History",
                  ),
                  BagikanWidget(
                    namaIcon: Icons.share,
                    isiText: "Bagikan Aplikasi",
                  ),
                  RatingWidget(
                    namaIcon: Icons.star,
                    isiText: "Beri Rating",
                    url:
                        'https://play.google.com/store/apps/details?id=com.yogadev.tracking',
                  ),
                  EmailtoWidget(
                    namaIcon: Icons.mail,
                    isiText: "Kontak Kami",
                  ),
                ],
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
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {},
                child: Container(
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color.fromARGB(255, 246, 142, 37),
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dehaze_sharp,
                        color: Color.fromARGB(255, 246, 142, 37),
                      ),
                      Text(
                        'Lainnya',
                        style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 246, 142, 37),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
