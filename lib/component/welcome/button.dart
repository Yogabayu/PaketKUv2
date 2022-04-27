import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracking/page/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            child: Center(
              child: InkWell(
                child: Container(
                    width: width / 1.5,
                    height: height / 18,
                    margin:
                        EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/image/google_logo.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ))),
                onTap: () async {
                  FirebaseService service = new FirebaseService();
                  try {
                    await service.signInwithGoogle();
                    User? user = FirebaseAuth.instance.currentUser;
                    final userName = user!.displayName;
                    final photo = user.photoURL;
                    Get.offAll(
                        () => Dashboard(
                              displayName: userName!,
                              photo: photo!,
                            ),
                        transition: Transition.cupertino);
                    print(FirebaseAuth.instance.currentUser);
                  } catch (e) {
                    if (e is FirebaseAuthException) {
                      print(e.message!);
                    }
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ignore: body_might_complete_normally_nullable
  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
