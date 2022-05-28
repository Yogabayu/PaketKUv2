import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:cek_ongkir/detail_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:tracking/component/dashboard/head.dart';
import 'package:tracking/constants/constant.dart';
import 'package:tracking/model/kota.dart';
import 'package:tracking/model/api.dart';
import 'package:tracking/page/ongkir_detail.dart';

class Ongkir extends StatefulWidget {
  const Ongkir({
    Key? key,
  }) : super(key: key);

  @override
  _OngkirState createState() => _OngkirState();
}

class _OngkirState extends State<Ongkir> {
  var kota_asal;
  var kota_tujuan;
  var berat;
  var kurir;
  var cityName;
  var cityTujuan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [
              // Color.fromARGB(156, 245, 196, 20),
              // Color.fromRGBO(255, 237, 34, 100),
              Color.fromARGB(251, 226, 192, 0),
              Color.fromARGB(156, 255, 249, 183),
            ],
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Head(),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.66,
                  margin: EdgeInsets.only(
                    top: width * 0.05,
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Color.fromARGB(168, 247, 171, 30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: width * 0.1,
                          left: width * 0.1,
                          right: width * 0.1,
                        ),
                        child: Center(
                          child: Text(
                            "Cek Harga Ongkir",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                            top: height * 0.04),
                        child: DropdownSearch<Kota>(
                          //kamu bisa mendekorasi tampilan field
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Kota/Kabupaten Asal",
                            hintText: "Pilih Kota/Kabupaten Asal",
                          ),

                          //tersedia mode menu dan mode dialog
                          mode: Mode.MENU,

                          //jika ingin menampilkan pencarian box
                          showSearchBox: true,

                          //di dalam event kita bisa set state atau menyimpan variabel
                          onChanged: (value) {
                            setState(() {
                              kota_asal = value?.cityId;
                              cityName = value?.cityName;
                            });
                          },

                          //kata yang ditampilkan setelah kita memilih
                          itemAsString: (item) =>
                              "${item!.type} ${item.cityName}",

                          //mencari data dari api
                          onFind: (text) async {
                            //mengambil data dari api dan fix bug android 6 eror handshake
                            final ioc = new HttpClient();
                            ioc.badCertificateCallback =
                                (X509Certificate cert, String host, int port) =>
                                    true;
                            final http = new IOClient(ioc);
                            var response = await http.get(Uri.parse(
                                "https://api.rajaongkir.com/starter/city?key=${key}"));

                            //parse string json as dart string dynamic
                            //get data just from results
                            List allKota = (jsonDecode(response.body)
                                    as Map<String, dynamic>)['rajaongkir']
                                ['results'];

                            //simpan data ke dalam model kota
                            var dataKota = Kota.fromJsonList(allKota);

                            //return data
                            return dataKota;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                            top: height * 0.04),
                        child: DropdownSearch<Kota>(
                          //kamu bisa merubah tampilan field sesuai keinginan
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Kota/Kabupaten Tujuan",
                            hintText: "Pilih Kota/Kabupaten Tujuan",
                          ),

                          //tersedia mode menu dan mode dialog
                          mode: Mode.MENU,

                          //jika kamu ingin menampilkan pencarian
                          showSearchBox: true,

                          //di dalam onchang3e kamu bisa set state
                          onChanged: (value) {
                            kota_tujuan = value?.cityId;
                            cityTujuan = value?.cityName;
                          },

                          //kata yang akan ditampilkan setelah dipilih
                          itemAsString: (item) =>
                              "${item!.type} ${item.cityName}",

                          //find data from api
                          onFind: (text) async {
                            //get data from api
                            final ioc = new HttpClient();
                            ioc.badCertificateCallback =
                                (X509Certificate cert, String host, int port) =>
                                    true;
                            final http = new IOClient(ioc);
                            var response = await http.get(Uri.parse(
                                "https://api.rajaongkir.com/starter/city?key=${key}"));

                            //parse string json as dart string dynamic
                            //get data just from results

                            List allKota = (jsonDecode(response.body)
                                    as Map<String, dynamic>)['rajaongkir']
                                ['results'];

                            //store data to model
                            var dataKota = Kota.fromJsonList(allKota);

                            //return data
                            return dataKota;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                            top: height * 0.04),
                        child: TextField(
                          //input hanya angka
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Berat Paket (gram)",
                            hintText: "Input Berat Paket",
                          ),
                          onChanged: (text) {
                            berat = text;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.1,
                            right: width * 0.1,
                            top: height * 0.04),
                        child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          showSelectedItems: true,
                          //pilihan kurir
                          items: ["JNE", "TIKI", "POS"],
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Jasa Kirim",
                            hintText: "Jasa Kirim",
                          ),
                          popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (text) {
                            kurir = text?.toLowerCase();
                          },
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
                                color: Colors.black),
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
                                icon: Icon(Icons.block_outlined,
                                    color: Colors.red),
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
                              Get.to(
                                  () => OngkirDetail(
                                        cityAsal: cityName,
                                        cityTujuan: cityTujuan,
                                        berat: berat,
                                        kota_asal: kota_asal,
                                        kota_tujuan: kota_tujuan,
                                        kurir: kurir,
                                      ),
                                  transition: Transition.cupertino)
                            }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
