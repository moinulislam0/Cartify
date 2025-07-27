import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BkashScreen extends StatefulWidget {
  const BkashScreen({super.key});

  @override
  State<BkashScreen> createState() => _BkashScreenState();
}

class _BkashScreenState extends State<BkashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bkash"),
      ),
      body: Text('bkash'),
    );
  }
}
