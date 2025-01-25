// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paketku/constant/constantVariabel.dart';
import 'package:url_launcher/url_launcher.dart';

class RatingWidget extends StatelessWidget {
  IconData namaIcon;
  String isiText;
  String url;
  RatingWidget({
    super.key,
    required this.namaIcon,
    required this.isiText,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(url);

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
                onPressed: () => launchUrl(
                  _url,
                  mode: LaunchMode.externalApplication,
                ),
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
