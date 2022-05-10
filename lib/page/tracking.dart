import 'package:flutter/material.dart';
import 'package:tracking/component/dashboard/head.dart';
import 'package:tracking/component/tracking/dialog_track.dart';
import 'package:tracking/component/tracking/history.dart';

class Tracking extends StatefulWidget {
  final String photo;
  final String name;
  const Tracking({Key? key, required this.photo, required this.name})
      : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  bool isRight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [
              // Color.fromARGB(156, 245, 196, 20),
              // Color.fromRGBO(255, 237, 34, 100),
              Color.fromARGB(251, 226, 192, 0),
              Color.fromARGB(156, 255, 249, 183),
            ],
          ),
        ),
        child: ListView(
          children: [
            Head(
              photo: "${widget.photo}",
              name: "${widget.name}",
            ),
            Dialog_track(),
            History(),
          ],
        ),
      ),
    );
  }
}
