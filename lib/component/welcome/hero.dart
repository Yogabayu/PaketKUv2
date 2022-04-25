import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            delay: const Duration(milliseconds: 100),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Color.fromARGB(255, 244, 233, 179),
              ),
              child: FadeInRight(
                delay: const Duration(milliseconds: 1600),
                child: SpinPerfect(
                  delay: const Duration(milliseconds: 2000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      height: height / 2,
                      width: width,
                      child: Image.asset("assets/image/final.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
