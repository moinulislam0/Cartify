import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/splashScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(MyApp());
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
    
  }
}
