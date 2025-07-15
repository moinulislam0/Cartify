
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:practice_method/view/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    // TODO: implement dependencie
  }
}
