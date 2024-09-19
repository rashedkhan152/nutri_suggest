import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/strings.dart';
import '../controller/login_controller.dart';
import '../controller/nutri_suggest_controller.dart';
import '../custom_view/custom_app_bar.dart';
import 'login_screen.dart';

class SuggestionScreen extends StatelessWidget {
  SuggestionScreen({super.key});

  final _c = Get.put(NutriSuggestController());
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // Select a random food item
    final randomIndex = Random().nextInt(_c.foodList.length);
    final randomFood = _c.foodList[randomIndex];

    return Scaffold(
      appBar: CustomAppBar(
        titleText: Strings.suggestion,
        actions: [
          IconButton(
            icon: const SizedBox(
              height: 25.0,
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await _loginController.signOut();
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Based on your data,\nWe suggest you this food named:',
              style: GoogleFonts.acme(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              randomFood.title!,
              style: GoogleFonts.acme(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 250.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    randomFood.image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Calories:',
                    style: GoogleFonts.acme(fontSize: 20.0),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(width: 80.0),
                Expanded(
                  flex: 2,
                  child: Text(
                    randomFood.calories.toString(),
                    style: GoogleFonts.acme(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Protein:',
                    style: GoogleFonts.acme(fontSize: 20.0),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(width: 80.0),
                Expanded(
                  child: Text(
                    randomFood.protein!,
                    style: GoogleFonts.acme(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Fat:',
                    style: GoogleFonts.acme(fontSize: 20.0),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(width: 80.0),
                Expanded(
                  child: Text(
                    randomFood.fat!,
                    style: GoogleFonts.acme(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Carbs:',
                    style: GoogleFonts.acme(fontSize: 20.0),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(width: 80.0),
                Expanded(
                  child: Text(
                    randomFood.carbs!,
                    style: GoogleFonts.acme(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
