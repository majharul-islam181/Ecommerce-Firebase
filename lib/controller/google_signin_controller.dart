import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/models/user_model.dart';
import 'package:ecommerce_firebase/screens/user-pannel/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please wait");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            userDeviceToken: '',
            country: '',
            userAddress: '',
            street: '',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
            city: "",
          );
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());

          Get.offAll(() => const UserScreen());
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_firebase/models/user_model.dart';
// import 'package:ecommerce_firebase/screens/user-pannel/user_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSigninController extends GetxController {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<bool> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      
//       if (googleSignInAccount == null) {
//         print("Google sign-in canceled by user.");
//         return false;
//       }

//       EasyLoading.show(status: "Signing in...");

//       final GoogleSignInAuthentication googleAuth =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       final User? user = userCredential.user;

//       if (user != null) {
//         UserModel userModel = UserModel(
//           uId: user.uid,
//           username: user.displayName ?? "Unknown User",
//           email: user.email ?? "",
//           phone: user.phoneNumber ?? "",
//           userImg: user.photoURL ?? "",
//           userDeviceToken: '',
//           country: '',
//           userAddress: '',
//           street: '',
//           isAdmin: false,
//           isActive: true,
//           createdOn: DateTime.now(),
//           city: "",
//         );

//         await FirebaseFirestore.instance
//             .collection('all-users')
//             .doc(user.uid)
//             .set(userModel.toMap(), SetOptions(merge: true));

//         EasyLoading.dismiss();
//         Get.offAll(() => const UserScreen());
//         return true;
//       } else {
//         EasyLoading.dismiss();
//         print("User is null after Google Sign-In.");
//         return false;
//       }
//     } catch (e) {
//       EasyLoading.dismiss();
//       print("Error in Google Sign-In: $e");
//       return false;
//     }
//   }
// }
