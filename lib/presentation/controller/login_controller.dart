import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../custom_view/custom_dialog.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs; // Observable
  var passwordController = TextEditingController().obs;

  var isPasswordObscure = true.obs;

  final _isLoading = false.obs;

  void toggleLoading(bool value) {
    if (value) {
      CustomDialog.showLoadingDialog();
    } else {
      Get.back();
    }
    _isLoading.value = value;
  }

  void togglePasswordObscurity() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in to Firebase with the generated credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
