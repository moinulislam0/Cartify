import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/homePage.dart';
import 'package:practice_method/view/wrapper.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 5))
        .then((value) => Get.off(()=>Wrapper()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/images.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
