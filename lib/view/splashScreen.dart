import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/wrapper.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 5))
        .then((value) => Get.off(() => Wrapper()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : null);
  }
}
