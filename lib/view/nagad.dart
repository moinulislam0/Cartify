import 'package:flutter/material.dart';

class NagadScreen extends StatefulWidget {
  const NagadScreen({super.key});

  @override
  State<NagadScreen> createState() => _NagadScreenState();
}

class _NagadScreenState extends State<NagadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nagad"),
      ),
      body: Text("Nagad"),
    );
  }
}