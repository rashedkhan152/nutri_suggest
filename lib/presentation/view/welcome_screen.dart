import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/strings.dart';
import '../controller/login_controller.dart';
import '../custom_view/custom_buttons.dart';
import 'basic_info_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: 250.0,
                      width: 250.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/chef.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  Strings.welcomeDesc,
                  style: GoogleFonts.aboreto(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (_loginController.isLoggedIn()) {
                        Get.to(() => BasicInfoScreen(
                              userName: FirebaseAuth.instance.currentUser!.displayName!,
                              userImage: FirebaseAuth.instance.currentUser!.photoURL!,
                            ));
                      } else {
                        Get.to(() => LoginScreen());
                      }
                    },
                    buttonText: Strings.getStarted.toUpperCase(),
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
