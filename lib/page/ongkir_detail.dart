// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:http/io_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:tracking/constants/constant.dart';
import 'package:tracking/model/api.dart';

class OngkirDetail extends StatefulWidget {
  final String kota_asal;
  final String kota_tujuan;
  final String cityAsal;
  final String cityTujuan;
  final String berat;
  final String kurir;
  const OngkirDetail({
    Key? key,
    required this.berat,
    required this.kota_asal,
    required this.kota_tujuan,
    required this.kurir,
    required this.cityAsal,
    required this.cityTujuan,
  }) : super(key: key);

  @override
  _OngkirDetailState createState() => _OngkirDetailState();
}

class _OngkirDetailState extends State<OngkirDetail> {
  List _data = [];
  bool isData = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future _getData() async {
    Future.delayed(Duration(seconds: 3));
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    try {
      final response = await http.post(
        Uri.parse(
          "https://api.rajaongkir.com/starter/cost",
        ),
        //MENGIRIM PARAMETER
        body: {
          "key": key,
          "origin": widget.kota_asal,
          "destination": widget.kota_tujuan,
          "weight": widget.berat,
          "courier": widget.kurir
        },
      ).then((value) {
        var data = jsonDecode(value.body);

        setState(() {
          _data = data['rajaongkir']['results'][0]['costs'];
          isData = true;
        });
      });
    } catch (e) {
      //ERROR
      Get.snackbar(
        "Pencarian Anda tidak ditemukan",
        "Max. berat 1000kg",
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
                  "Detail Ongkir",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.cityAsal} -> ${widget.cityTujuan}",
                        style: GoogleFonts.lato(
                          fontSize: height * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Jasa Kirim : ${widget.kurir.toUpperCase()} , ${widget.berat} gram",
                    style: GoogleFonts.lato(
                      fontSize: height * 0.02,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isData
              ? Container(
                  margin: EdgeInsets.only(
                    top: width * 0.03,
                    // bottom: width * 0.1,
                  ),
                  height: height * 0.7,
                  width: width,
                  child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text("${_data[index]['service']}"),
                        subtitle: Text("${_data[index]['description']}"),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Rp ${_data[index]['cost'][0]['value']}",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text("${_data[index]['cost'][0]['etd']} Hari")
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: width * 0.1,
                    height: width * 0.1,
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    ));
  }
}
