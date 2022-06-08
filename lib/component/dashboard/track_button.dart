import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/constants/constant.dart';
import 'package:tracking/page/tracking.dart';

class TrackButton extends StatefulWidget {
  const TrackButton({
    Key? key,
  }) : super(key: key);

  @override
  _TrackButtonState createState() => _TrackButtonState();
}

class _TrackButtonState extends State<TrackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.28,
        margin: EdgeInsets.only(
          left: width * 0.1,
          right: width * 0.1,
        ),
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Color.fromARGB(168, 247, 171, 30),
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
                "Lacak Paket",
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
              onTap: () =>
                  {Get.to(() => Tracking(), transition: Transition.cupertino)},
            ),
          ],
        ));
  }
}
