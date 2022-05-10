import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackButton extends StatefulWidget {
  const TrackButton({Key? key}) : super(key: key);

  @override
  _TrackButtonState createState() => _TrackButtonState();
}

class _TrackButtonState extends State<TrackButton> {
  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    return Container(
        height: height * 0.28,
        margin: EdgeInsets.only(
          left: width * 0.1,
          right: width * 0.1,
        ),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Color.fromARGB(255, 247, 211, 30),
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
              child: Text(
                "Tracking Paket",
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: width * 0.03,
                left: width * 0.1,
                right: width * 0.1,
              ),
              child: Text(
                "Cek riwayat perjalanan dari paket anda",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold,
                ),
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
                        'Cek Sekarang ',
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
              onTap: () => {},
            ),
          ],
        ));
  }
}
