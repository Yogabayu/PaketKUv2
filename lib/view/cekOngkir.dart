import 'dart:convert';
import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constant/constantVariabel.dart';
import 'package:tracking/controller/ongkir_controller.dart';
import 'package:tracking/model/api.dart';
import 'package:tracking/model/kota.dart';
import 'package:tracking/model/ongkir.dart';
import 'package:tracking/view/dashboard.dart';

class CekOngkir extends StatefulWidget {
  const CekOngkir({Key? key}) : super(key: key);

  @override
  _CekOngkirState createState() => _CekOngkirState();
}

class _CekOngkirState extends State<CekOngkir> {
  final controllerOngkir = Get.put(OngkirController());
  late Future<Ongkir> futureOngkir;
  var kota_asal, kota_tujuan, berat, kurir, cityName, cityTujuan;

  @override
  void initState() {
    super.initState();
    futureOngkir = controllerOngkir.getData("", "", "", "", "");
  }

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.04),
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
                      "Cek Ongkir Paket",
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
                margin: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: width * 0.07,
                ),
                width: width,
                height: width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kota Asal",
                      style: GoogleFonts.raleway(
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
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 120, 122),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            width: width * 0.01,
                            child: Icon(
                              Icons.near_me,
                              color: Color.fromARGB(255, 4, 120, 122),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.09,
                          ),
                          Container(
                            width: width * 0.67,
                            child: DropdownSearch<Kota>(
                              dropdownSearchDecoration:
                                  InputDecoration(border: InputBorder.none),
                              dropdownSearchBaseStyle: GoogleFonts.raleway(
                                fontSize: height * 0.02,
                                color: Color.fromARGB(255, 2, 84, 86),
                              ),
                              mode: Mode.MENU,
                              showSearchBox: true,
                              onChanged: (value) {
                                setState(() {
                                  kota_asal = value?.cityId;
                                  cityName = value?.cityName;
                                });
                              },
                              itemAsString: (item) =>
                                  "${item!.type} ${item.cityName}",
                              onFind: (text) async {
                                final ioc = new HttpClient();
                                ioc.badCertificateCallback =
                                    (X509Certificate cert, String host,
                                            int port) =>
                                        true;
                                final http = new IOClient(ioc);
                                var response = await http.get(Uri.parse(
                                    "https://api.rajaongkir.com/starter/city?key=${key}"));

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
                height: width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kota Tujuan",
                      style: GoogleFonts.raleway(
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
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 120, 122),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            width: width * 0.01,
                            child: Icon(
                              Icons.near_me,
                              color: Color.fromARGB(255, 4, 120, 122),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.09,
                          ),
                          Container(
                            width: width * 0.67,
                            child: DropdownSearch<Kota>(
                              dropdownSearchDecoration:
                                  InputDecoration(border: InputBorder.none),
                              dropdownSearchBaseStyle: GoogleFonts.raleway(
                                fontSize: height * 0.02,
                                color: Color.fromARGB(255, 2, 84, 86),
                              ),
                              mode: Mode.MENU,
                              showSearchBox: true,
                              onChanged: (value) {
                                setState(() {
                                  kota_tujuan = value?.cityId;
                                  cityTujuan = value?.cityName;
                                });
                              },
                              itemAsString: (item) =>
                                  "${item!.type} ${item.cityName}",
                              onFind: (text) async {
                                final ioc = new HttpClient();
                                ioc.badCertificateCallback =
                                    (X509Certificate cert, String host,
                                            int port) =>
                                        true;
                                final http = new IOClient(ioc);
                                var response = await http.get(Uri.parse(
                                    "https://api.rajaongkir.com/starter/city?key=${key}"));

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
                height: width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Berat Paket",
                      style: GoogleFonts.raleway(
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
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 120, 122),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            width: width * 0.01,
                            child: Icon(
                              Icons.monitor_weight_outlined,
                              color: Color.fromARGB(255, 4, 120, 122),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.09,
                          ),
                          Container(
                            width: width * 0.6,
                            child: TextField(
                              //input hanya angka
                              keyboardType: TextInputType.number,

                              onChanged: (text) {
                                berat = text;
                              },
                            ),
                          ),
                          Container(
                            width: width * 0.09,
                            child: Text(
                              "gr",
                              style: GoogleFonts.raleway(
                                fontSize: height * 0.018,
                                color: Color.fromARGB(255, 4, 120, 122),
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
                height: width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jasa Kirim",
                      style: GoogleFonts.raleway(
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
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 120, 122),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            width: width * 0.01,
                            child: Icon(
                              Icons.near_me,
                              color: Color.fromARGB(255, 4, 120, 122),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.09,
                          ),
                          Container(
                            width: width * 0.67,
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              showSelectedItems: true,
                              //pilihan kurir
                              items: ["JNE", "TIKI", "POS"],
                              dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              popupItemDisabled: (String s) =>
                                  s.startsWith('I'),
                              onChanged: (text) {
                                kurir = text?.toLowerCase();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                    width: width * 2,
                    height: height / 18,
                    margin: EdgeInsets.only(
                      top: width * 0.03,
                      left: width * 0.1,
                      right: width * 0.1,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 4, 120, 122)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Cek Ongkir ',
                          style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          CupertinoIcons.arrow_right,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ))),
                onTap: () => {
                  if (kota_asal == null ||
                      kota_tujuan == null ||
                      berat == null ||
                      kurir == null)
                    {
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
                      ),
                    }
                  else
                    {
                      setState(() {
                        isLoading = true;
                        futureOngkir = controllerOngkir.getData(
                            key, kota_asal, kota_tujuan, berat, kurir);
                      }),
                    }
                },
              ),
              FutureBuilder<Ongkir>(
                future: futureOngkir,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Container();
                    return Container(
                      margin: EdgeInsets.only(
                        top: width * 0.03,
                      ),
                      height: height * 0.5,
                      width: width,
                      child: ListView.builder(
                        itemCount: snapshot
                            .data!.rajaongkir!.results![0].costs!.length,
                        itemBuilder: (_, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                Radius.circular(width * 0.05),
                              ),
                              color: Color.fromARGB(255, 4, 120, 122)
                                  .withOpacity(0.5),
                            ),
                            margin: EdgeInsets.all(width * 0.02),
                            child: ListTile(
                              style: ListTileStyle.list,
                              title: Text(
                                "${snapshot.data!.rajaongkir!.results![0].costs![index].service}",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                "${snapshot.data!.rajaongkir!.results![0].costs![index].description}",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Rp. ${snapshot.data!.rajaongkir!.results![0].costs![index].cost![0].value}",
                                    style: GoogleFonts.raleway(
                                      fontSize: width * 0.05,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                      "${snapshot.data!.rajaongkir!.results![0].costs![index].cost![0].etd} Hari")
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      margin: EdgeInsets.all(width * 0.2),
                      height: width * 0.2,
                      child: Text(
                        "${snapshot.error}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: height * 0.02,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(width * 0.2),
                      width: width * 0.1,
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 4, 120, 122),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
