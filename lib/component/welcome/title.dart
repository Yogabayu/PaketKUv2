import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Title1 extends StatelessWidget {
  const Title1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            // width: w / 1.5,
            // height: h / 10,
            child: Center(
              child: Text(
                "-- TrackPad --",
                style: GoogleFonts.lato(
                  fontSize: height * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(214, 14, 13, 9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title2 extends StatelessWidget {
  const Title2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            child: Center(
              child: Text(
                "Track Your Package and make sure",
                style: GoogleFonts.lato(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title3 extends StatelessWidget {
  const Title3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            child: Center(
              child: Text(
                "it arrives to destination",
                style: GoogleFonts.lato(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
