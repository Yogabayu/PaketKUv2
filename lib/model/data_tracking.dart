// class Data {
//   final int id;
//   final String receipt;
//   final String jasa;

//   const Data({
//     required this.id,
//     required this.receipt,
//     required this.jasa,
//   });
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

bool isLoading = true;

// class FirebaseService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // ignore: body_might_complete_normally_nullable
//   Future<String?> signInwithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       await _auth.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//       throw e;
//     }
//   }

//   Future<void> signOutFromGoogle() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }
