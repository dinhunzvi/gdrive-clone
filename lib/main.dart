import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdrive_clone/controllers/authentication_controller.dart';
import 'package:gdrive_clone/firebase_options.dart';
import 'package:gdrive_clone/screens/login_screen.dart';
import 'package:gdrive_clone/screens/nav_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  AuthenticationController authenticationController =
    Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return authenticationController.user.value == null ? LoginScreen() : NavScreen();
    });
  }
}



