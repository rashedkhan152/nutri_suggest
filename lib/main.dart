import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../presentation/view/welcome_screen.dart';
import 'di/nutri_suggest_module.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

void main() async {
  NutriSuggestModule.dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const NutriSuggestApp());
}

class NutriSuggestApp extends StatelessWidget {
  const NutriSuggestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nutri Suggest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
