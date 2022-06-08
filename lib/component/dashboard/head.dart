import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/constants/constant.dart';
import 'package:tracking/page/dashboard.dart';
import 'package:tracking/page/welcome.dart';

class Head extends StatefulWidget {
  const Head({
    Key? key,
  }) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () =>
                  {Get.to(() => Dashboard(), transition: Transition.cupertino)},
              child: Icon(
                Icons.home,
                size: 40,
              )),
          GestureDetector(
            onTap: () async {
              isLoading = true;
              print(isLoading);
              Get.offAll(() => Welcome(), transition: Transition.cupertino);
            },
            child: Icon(
              CupertinoIcons.square_arrow_right,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
