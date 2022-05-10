import 'package:flutter/material.dart';
import 'package:tracking/constants/constant.dart';

class DisplayName extends StatelessWidget {
  final String displayName;
  const DisplayName({Key? key, required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
