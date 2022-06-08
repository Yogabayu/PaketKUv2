import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/helper/sql_helper.dart';
import 'package:tracking/model/api.dart';
import 'package:tracking/model/receipt.dart';
import 'package:tracking/page/tracking%20_detail.dart';

class TrackingController extends GetxController {
  // var data = [].obs;

  String dropdownvalue = 'JNE';
  TextEditingController receipt = TextEditingController();
  String jKirim = "";
  List<dynamic> data = []; //edited line
  Map<String, dynamic> map = {};

  Future<void> addItem(dataReceipt, dataDropdowwn) async {
    await SQLHelper.createItem(
      dataReceipt,
      dataDropdowwn,
    );
    Get.to(
        () => TrackingDetail(
              receipt: dataReceipt,
              jk: dataDropdowwn,
            ),
        transition: Transition.cupertino);
  }

  Future<Receipt> fetchData(jk, receipt) async {
    if (jk == 'Shopee express') {
      jKirim = "spx";
      print(jKirim);
    } else if (jk == 'SAP express') {
      jKirim = "sap";
      print(jKirim);
    } else if (jk == 'ID express') {
      jKirim = "ide";
      print(jKirim);
    } else {
      jKirim = jk;
      print(jKirim);
    }
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
        throw Exception('Gagal mengambil data, mohon ulangi kembali');
      },
    );

    if (response.statusCode == 200) {
      return Receipt.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal mengambil data, cek kembali inputan anda');
    }
  }

  // Future<http.Response> getSWData(jk, receipt) async {
  //   if (jk == 'Shopee express') {
  //     jKirim = "spx";
  //     print(jKirim);
  //   } else if (jk == 'SAP express') {
  //     jKirim = "sap";
  //     print(jKirim);
  //   } else if (jk == 'ID express') {
  //     jKirim = "ide";
  //     print(jKirim);
  //   } else {
  //     jKirim = jk;
  //     print(jKirim);
  //   }
  //   final ioc = new HttpClient();
  //   ioc.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   final http = new IOClient(ioc);
  //   final response = await http.get(Uri.parse(
  //       "https://api.binderbyte.com/v1/track?api_key=" +
  //           apiKey +
  //           "&courier=" +
  //           jKirim +
  //           "&awb=" +
  //           receipt));
  //   if (response.statusCode == 200) {
  //     isRight = true;
  //     // GetDta receipt =
  //     // map = new Map<String, dynamic>.from(json.decode(response.body));
  //     // // print(map['data']['history']);
  //     // data = map['data']['history'];
  //     print(GetData.fromJson(jsonDecode(response.body)));
  //     return GetData.fromJson(jsonDecode(response.body));
  //   } else {
  //     isRight = false;
  //     Get.snackbar(
  //       "Maaf",
  //       "Data tidak ditemukan",
  //       icon: Icon(Icons.block_outlined, color: Colors.red),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color.fromARGB(96, 254, 172, 31),
  //       borderRadius: 20,
  //       margin: EdgeInsets.all(15),
  //       colorText: Colors.black,
  //       duration: Duration(seconds: 4),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );
  //   }
  //   // return "sukses";
  // }
}
