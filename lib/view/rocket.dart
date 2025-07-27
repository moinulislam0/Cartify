import 'package:flutter/material.dart';

class RocketScreen extends StatefulWidget {
  const RocketScreen({super.key});

  @override
  State<RocketScreen> createState() => _RocketScreenState();
}

class _RocketScreenState extends State<RocketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rocket"),
      ),
      body: Text("Rocket"),
    );
  }
}