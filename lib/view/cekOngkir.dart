// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paketku/constant/constantVariabel.dart';
import 'package:paketku/controller/ongkir_controller.dart';
import 'package:paketku/model/api.dart';
import 'package:paketku/model/dummy_data_ikon.dart';
import 'package:paketku/model/kota.dart';
import 'package:paketku/model/ongkir.dart';
import 'package:paketku/view/dashboard.dart';
import 'package:paketku/view/hasil_cek_ongkir.dart';
import 'package:paketku/view/lainnya.dart';

class CekOngkir extends StatefulWidget {
  const CekOngkir({super.key});

  @override
  _CekOngkirState createState() => _CekOngkirState();
}

class _CekOngkirState extends State<CekOngkir> {
  final controllerOngkir = Get.put(OngkirController());
  late Future<Ongkir> futureOngkir;
  var kota_asal, kota_tujuan, berat, kurir, cityName, cityTujuan;
  static double _minHeight = 0, _maxHeight = 300;
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;
  int selectedCard = -1;
  String _jkpilih = "";

  @override
  void initState() {
    super.initState();
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                    left: width * 0.2,
                    right: width * 0.2,
                  ),
                  height: width * 0.2,
                  width: width,
                  child: Center(
                    child: Text(
                      "CEK ONGKIR",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: height * 0.04,
                        color: Color.fromARGB(255, 246, 142, 37),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: width * 0.07,
                  ),
                  width: width,
                  height: width * 0.27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kota Asal",
                        style: GoogleFonts.roboto(
                          fontSize: height * 0.02,
                          color: Color.fromARGB(255, 4, 120, 122),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: width * 0.14,
                        margin: EdgeInsets.all(width * 0.03),
                        padding: EdgeInsets.all(width * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 246, 142, 37),
                            width: 3,
                          ),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(width * 0.09),
                          ),
                          color: Colors.white,
                        ),
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
                            SizedBox(
                              width: width * 0.02,
                            ),
                            SizedBox(
                              width: width * 0.6,
                              height: height * 0.14,
                              child: DropdownSearch<Kota>(
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 246, 142, 37),
                                    suffixIconColor:
                                        Color.fromARGB(255, 246, 142, 37),
                                    // helperText: "  Kota Asal",
                                    border: InputBorder.none,
                                  ),
                                ),
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,
                                ),
                                itemAsString: (item) =>
                                    "${item.type} ${item.cityName}",
                                onChanged: (value) {
                                  setState(() {
                                    kota_asal = value?.cityId;
                                    cityName = value?.cityName;
                                  });
                                },
                                asyncItems: (text) async {
                                  final ioc = new HttpClient();
                                  ioc.badCertificateCallback =
                                      (X509Certificate cert, String host,
                                              int port) =>
                                          true;
                                  final http = new IOClient(ioc);
                                  var response = await http.get(Uri.parse(
                                      "https://api.rajaongkir.com/starter/city?key=$key"));

                                  List allKota = (jsonDecode(response.body)
                                          as Map<String, dynamic>)['rajaongkir']
                                      ['results'];

                                  var dataKota = Kota.fromJsonList(allKota);

                                  return dataKota;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  width: width,
                  height: width * 0.27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Berat Paket",
                        style: GoogleFonts.roboto(
                          fontSize: height * 0.018,
                          color: Color.fromARGB(255, 4, 120, 122),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: width * 0.14,
                        margin: EdgeInsets.all(width * 0.03),
                        padding: EdgeInsets.all(width * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 246, 142, 37),
                            width: 3,
                          ),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(width * 0.09),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.02,
                            ),
                            SizedBox(
                              width: width * 0.01,
                              child: Icon(
                                Icons.monitor_weight_outlined,
                                color: Color.fromARGB(255, 246, 142, 37),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            SizedBox(
                              width: width * 0.55,
                              child: GestureDetector(
                                onTap: () => FocusManager.instance.primaryFocus
                                    ?.unfocus(),
                                onVerticalDragEnd: (DragEndDetails details) =>
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus(),
                                child: TextField(
                                  //input hanya angka
                                  keyboardType: TextInputType.number,

                                  onChanged: (text) {
                                    berat = text;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.09,
                              child: Text(
                                "gr",
                                style: GoogleFonts.roboto(
                                  fontSize: height * 0.018,
                                  color: Color.fromARGB(255, 246, 142, 37),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  width: width,
                  height: width * 0.27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kota Tujuan",
                        style: GoogleFonts.roboto(
                          fontSize: height * 0.018,
                          color: Color.fromARGB(255, 4, 120, 122),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: width * 0.14,
                        margin: EdgeInsets.all(width * 0.03),
                        padding: EdgeInsets.all(width * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 246, 142, 37),
                            width: 3,
                          ),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(width * 0.09),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 246, 142, 37),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            SizedBox(
                              width: width * 0.6,
                              height: height * 0.16,
                              child: DropdownSearch<Kota>(
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 246, 142, 37),
                                    suffixIconColor:
                                        Color.fromARGB(255, 246, 142, 37),
                                    // helperText: "  Kota Asal",
                                    border: InputBorder.none,
                                  ),
                                ),
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,
                                ),
                                itemAsString: (item) =>
                                    "${item.type} ${item.cityName}",
                                onChanged: (value) {
                                  setState(() {
                                    kota_tujuan = value?.cityId;
                                    cityTujuan = value?.cityName;
                                  });
                                },
                                asyncItems: (text) async {
                                  final ioc = new HttpClient();
                                  ioc.badCertificateCallback =
                                      (X509Certificate cert, String host,
                                              int port) =>
                                          true;
                                  final http = new IOClient(ioc);
                                  var response = await http.get(Uri.parse(
                                      "https://api.rajaongkir.com/starter/city?key=$key"));

                                  List allKota = (jsonDecode(response.body)
                                          as Map<String, dynamic>)['rajaongkir']
                                      ['results'];

                                  var dataKota = Kota.fromJsonList(allKota);

                                  return dataKota;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  width: width,
                  height: width * 0.27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jasa Kirim",
                        style: GoogleFonts.roboto(
                          fontSize: height * 0.018,
                          color: Color.fromARGB(255, 4, 120, 122),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: width * 0.14,
                        margin: EdgeInsets.all(width * 0.03),
                        padding: EdgeInsets.all(width * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 246, 142, 37),
                            width: 3,
                          ),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(width * 0.09),
                          ),
                          color: Colors.white,
                        ),
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
                              SizedBox(
                                width: width * 0.35,
                                child: Center(
                                  child: Obx(
                                    () => SvgPicture.asset(
                                      controllerOngkir.namaSVG.value == ''
                                          ? ''
                                          : controllerOngkir.namaSVG.value,
                                      width: width * 0.02,
                                      height: width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: width * 0.25,
                                  child: Obx(
                                    () => Text(
                                      controllerOngkir.namaJasa.value == ''
                                          ? ''
                                          : controllerOngkir.namaJasa.value,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        fontSize: height * 0.018,
                                        color: Color.fromARGB(255, 4, 120, 122),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 246, 142, 37),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: width * 0.09,
                    ),
                    width: width * 0.35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromARGB(255, 246, 142, 37),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (kota_asal == null ||
                            kota_tujuan == null ||
                            berat == "" ||
                            controllerOngkir.namaJasa.value == "") {
                          Get.snackbar(
                            "Pencarian Anda tidak ditemukan",
                            "Silahkan isi semua kolom terlebih dahulu",
                            icon: Icon(Icons.block_outlined, color: Colors.red),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Color.fromARGB(128, 246, 142, 37),
                            borderRadius: 20,
                            margin: EdgeInsets.all(15),
                            colorText: Colors.black,
                            duration: Duration(seconds: 4),
                            isDismissible: true,
                            dismissDirection: DismissDirection.horizontal,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                        } else {
                          Get.offAll(
                            () => HasilCekOngkir(
                              jk: controllerOngkir.namaJasa.value.toLowerCase(),
                              kotaAsal: kota_asal,
                              kotaTujuan: kota_tujuan,
                              totalPaket: berat,
                              namaSVG: controllerOngkir.namaSVG.value,
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
              ],
            ),
            GestureDetector(
              onPanUpdate: (details) {
                _offset = Offset(0, _offset.dy - details.delta.dy);
                if (_offset.dy < _CekOngkirState._minHeight) {
                  _offset = Offset(0, _CekOngkirState._minHeight);
                  _isOpen = false;
                } else if (_offset.dy > _CekOngkirState._maxHeight) {
                  _offset = Offset(0, _CekOngkirState._maxHeight);
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
                        color: Colors.grey.withAlpha(128),
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
                        itemCount: dummyJasa.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.5),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final svg = dummyJasa[index];
                          return GestureDetector(
                            onTap: () {
                              controllerOngkir.gantiSvg(svg.images, svg.title);
                              setState(() {
                                selectedCard = index;
                                _jkpilih = svg.title;
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
                                      width: selectedCard == index ? 3 : 1,
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
                                        color:
                                            Color.fromARGB(255, 246, 142, 37),
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
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
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
                          Icons.price_change_outlined,
                          color: Color.fromARGB(255, 246, 142, 37),
                        ),
                        Text(
                          'Cek Ongkir',
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 246, 142, 37),
                            fontWeight: FontWeight.bold,
                          ),
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
                          style: TextStyle(),
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

  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_isOpen) {
        double value = _offset.dy +
            50; // we increment the height of the Container by 10 every 5ms
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset =
              Offset(0, _maxHeight); // makes sure it does't go above maxHeight
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 50; // we decrement the height by 10 here
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
