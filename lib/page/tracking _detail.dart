import 'package:flutter/material.dart';

class TrackingDetail extends StatefulWidget {
  const TrackingDetail({Key? key}) : super(key: key);

  @override
  _TrackingDetailState createState() => _TrackingDetailState();
}

class _TrackingDetailState extends State<TrackingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
    );
  }
}
