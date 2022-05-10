import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking/model/data_tracking.dart';
import 'package:tracking/page/dashboard.dart';
import 'package:tracking/page/welcome.dart';

class Head extends StatefulWidget {
  const Head({Key? key, required this.photo, required this.name})
      : super(key: key);

  final String photo;
  final String name;

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => {
              Get.to(
                  () => Dashboard(
                      displayName: "${widget.name}", photo: "${widget.photo}"),
                  transition: Transition.cupertino)
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage("${widget.photo}"),
              radius: 30, //Text
            ),
          ),
          GestureDetector(
            onTap: () async {
              isLoading = true;
              print(isLoading);
              FirebaseService service = new FirebaseService();
              service.signOutFromGoogle();
              Get.offAll(() => Welcome(), transition: Transition.cupertino);
            },
            child: Icon(
              CupertinoIcons.square_arrow_right,
              size: 40,
              // color: Colors.white,
            ),
            // child: CircleAvatar(
            //   // backgroundColor: Color.fromARGB(225, 181, 180, 180),
            //   backgroundColor: Colors.transparent,
            //   backgroundImage:
            //       AssetImage('assets/image/notification.png'),
            //   radius: 15, //Text
            // ),
          ),
        ],
      ),
    );
  }
}
