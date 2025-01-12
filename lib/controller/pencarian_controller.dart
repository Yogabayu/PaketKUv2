import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paketku/helper/sql_helper.dart';

class PencarianController extends GetxController {
  final snackBar = SnackBar(
    content: Text('Sukses menghapus'),
    duration: Duration(seconds: 2),
  );
  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
  }
}
