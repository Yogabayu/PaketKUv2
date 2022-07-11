// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking/constant/constantVariabel.dart';
import 'package:tracking/helper/sql_helper.dart';

class DeleteAllWidget extends StatelessWidget {
  IconData namaIcon;
  String isiText;
  DeleteAllWidget({
    Key? key,
    required this.namaIcon,
    required this.isiText,
  }) : super(key: key);
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
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 2.5),
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
                onPressed: () async {
                  try {
                    await SQLHelper.deleteAll();
                    final snackBar = SnackBar(
                      content: Text('Sukses menghapus semua data'),
                      duration: Duration(seconds: 2),
                    );

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  } catch (e) {
                    print("Eror");
                  }
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
