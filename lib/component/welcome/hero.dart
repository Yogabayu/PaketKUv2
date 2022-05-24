import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    return SizedBox(
      width: Get.width,
      height: Get.height / 2,
      child: Stack(
        children: [
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Color.fromARGB(255, 244, 233, 179),
              ),
              child: Container(
                margin: EdgeInsets.all(height * 0.03),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(
                      'assets/image/hero2.json',
                      height: height * 0.5,
                      width: width,
                    ), // Front image
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
