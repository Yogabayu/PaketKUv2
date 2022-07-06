import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CekOngkir2 extends StatefulWidget {
  const CekOngkir2({Key? key}) : super(key: key);

  @override
  _CekOngkir2State createState() => _CekOngkir2State();
}

class _CekOngkir2State extends State<CekOngkir2> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    bool _isSukses = true;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 55, 202, 236),
          child: Icon(Icons.home),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 202, 236),
          title: Text(
            "Lacak Paket",
            style: GoogleFonts.roboto(
              fontSize: height * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // wordSpacing: 5,
              // letterSpacing: 2,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              print("object");
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 5, 78, 94),
                        ),
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      width: width * 0.4,
                      height: width * 0.2,
                      child: SvgPicture.asset("assets/logo/sicepat.svg"),
                    ),
                    SizedBox(
                      height: width * 0.01,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Kota Asal",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 5, 78, 94),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Jakarta",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 246, 142, 37),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Status",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 5, 78, 94),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sedang diProses",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 246, 142, 37),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Kota Tujuan",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 5, 78, 94),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Ponorogo",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 246, 142, 37),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                color: Colors.black.withOpacity(0.1),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: width * 0.03,
                ),
                height: height * 0.5,
                width: width,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(width * 0.05),
                        ),
                        border: Border.all(
                          color: Color.fromARGB(255, 5, 78, 94),
                          width: width * 0.005,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: width * 0.05,
                        left: width * 0.07,
                        right: width * 0.07,
                      ),
                      child: ListTile(
                        style: ListTileStyle.list,
                        title: Text(
                          "OKE",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.02,
                            color: Color.fromARGB(255, 5, 78, 94),
                          ),
                        ),
                        subtitle: Text(
                          "Ongkos Kirim Ekonomis",
                          style: GoogleFonts.roboto(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Rp. 12",
                              style: GoogleFonts.roboto(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 142, 37),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2 Hari",
                              style: GoogleFonts.roboto(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.price_change_outlined,
                      ),
                      Text(
                        'Cek Ongkir',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dehaze_sharp,
                      ),
                      Text(
                        'Lainnya',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
