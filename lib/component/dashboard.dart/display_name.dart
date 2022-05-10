import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/page/dashboard.dart';

class DisplayName extends StatelessWidget {
  final String displayName;
  const DisplayName({Key? key, required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    return Container(
      margin: EdgeInsets.only(left: width * 0.1),
      child: Text(
        "Hello, ${displayName}",
        maxLines: 2,
        style: TextStyle(
          fontSize: width * 0.07,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
