import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'firebase_auth.dart';

class LogInController extends GetxController {
  var isLoading = false.obs;
  bool isLoggedIn = false;
  FireBaseAuthManager services = FireBaseAuthManager();

  Future<bool> googleAuth() async {
    isLoading.value = true;

    GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await services.fireBaseGoogleAuth(credential);
      isLoggedIn = true;
    }

    isLoading.value = false;
    return isLoggedIn;
  }
}
