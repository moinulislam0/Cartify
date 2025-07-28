import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/controller/beautyController.dart';
import 'package:practice_method/controller/categoriesController.dart';
import 'package:practice_method/controller/smartphoneController.dart';
import 'package:practice_method/model/beautyModel.dart';
import 'package:practice_method/view/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Global override to ignore SSL errors in Dart HTTP clients
  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp();

  runApp(MyApp());
}

// This overrides the HttpClient globally to ignore SSL cert errors for all Dart HTTP requests
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Method Practice",
      initialBinding: GetxBinding(),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Categoriescontroller());
    Get.put(Smartphonecontroller());
    Get.put(Beautycontroller());
  }
}
