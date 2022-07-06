import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/helper/sql_helper.dart';
// import 'package:tracking/helper/sql_helper.dart';
import 'package:tracking/model/api.dart';
import 'package:tracking/model/receipt.dart';
// import 'package:tracking/view/tracking.dart';
// import 'package:tracking/page/tracking%20_detail.dart';

class TrackingController extends GetxController {
  var items = [
    'JNE',
    'POS',
    'JNT',
    'sicepat',
    'TIKI',
    'Anteraja',
    'NINJA',
    'LION',
    'JET',
    'ID express',
    'SAP express',
    'Shopee express'
  ];
  String dropdownvalue = 'JNE';
  TextEditingController receipt = TextEditingController();
  String jKirim = "";
  List<dynamic> data = []; //edited line
  Map<String, dynamic> map = {};

  // Future<void> showData(dataReceipt, dataDropdowwn) async {
  //   Get.to(
  //     () => Tracking(
  //       receipt: dataReceipt,
  //       jk: dataDropdowwn,
  //     ),
  //     transition: Transition.fade,
  //     duration: Duration(seconds: 1),
  //   );
  // }
  RxString namaSVG = "".obs;
  RxString namajs = "".obs;

  void gantiSvg(
    String namaSVG,
    String namajs,
  ) {
    this.namaSVG.value = namaSVG;
    this.namajs.value = namajs;
    update();
  }

  Future<Receipt> fetchData(receipt, jk) async {
    try {
      if (jk == 'Shopee express') {
        jKirim = "spx";
      } else if (jk == 'SAP express') {
        jKirim = "sap";
      } else if (jk == 'ID express') {
        jKirim = "ide";
      } else if (jk == 'J&T') {
        jKirim = "jnt";
      } else {
        jKirim = jk;
      }
      print(receipt);
      print(jk);
      print(apiKey);
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response = await http
          .get(Uri.parse("https://api.binderbyte.com/v1/track?api_key=" +
              apiKey +
              "&courier=" +
              jKirim +
              "&awb=" +
              receipt))
          .timeout(
        const Duration(seconds: 4),
        onTimeout: () {
          throw 'Gagal mengambil data, mohon ulangi kembali';
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // await SQLHelper.createItem(
        //   receipt,
        //   jKirim,
        // );

        return Receipt.fromJson(jsonDecode(response.body));
      } else {
        throw 'Gagal mengambil data. Cek kembali inputan anda';
      }
    } on SocketException {
      throw 'Mohon Cek internet anda';
    } on TimeoutException {
      throw 'Waktu Habis , silahkan reload halaman';
    }
  }
}
