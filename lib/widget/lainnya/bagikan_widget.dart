// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:paketku/constant/constantVariabel.dart';

class BagikanWidget extends StatelessWidget {
  IconData namaIcon;
  String isiText;
  BagikanWidget({
    super.key,
    required this.namaIcon,
    required this.isiText,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          namaIcon,
          color: Color.fromARGB(255, 246, 142, 37),
          size: width * 0.07,
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.withAlpha(76), width: 2.5),
            ),
          ),
          width: width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isiText,
                style: GoogleFonts.roboto(
                  fontSize: height * 0.024,
                  color: Color.fromARGB(255, 4, 120, 122),
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Share.share(
                      'check out this App https://play.google.com/store/apps/details?id=com.yogadev.tracking');
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 246, 142, 37),
                ),
                iconSize: width * 0.05,
              )
            ],
          ),
        )
      ],
    );
  }
}
