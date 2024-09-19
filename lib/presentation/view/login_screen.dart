import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/strings.dart';
import '../controller/login_controller.dart';
import '../custom_view/custom_app_bar.dart';
import '../custom_view/custom_dialog.dart';
import 'basic_info_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: Strings.login,
        onBackPressed: SystemNavigator.pop,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Strings.appName,
                  style: GoogleFonts.aclonica(fontSize: 36.0, color: Colors.teal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/login.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  Strings.loginDesc,
                  style: GoogleFonts.aboreto(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton.icon(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await _c.signInWithGoogle();
                        Get.to(() => BasicInfoScreen(
                              userName: userCredential.user!.displayName!,
                              userImage: userCredential.user!.photoURL!,
                            ));
                      } catch (e) {
                        debugPrint("Error during Google Sign-In: $e");
                        CustomDialog.showError("Error during Google Sign-In: $e");
                      }
                    },
                    icon: SizedBox(
                      height: 36.0,
                      child: Image.asset('assets/google.png'),
                    ),
                    label: Text(
                      Strings.continueWithGoogle.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
