import 'package:flutter/material.dart';
import 'package:practice_method/widgets/CartListWidget.dart';

class Cartlist extends StatelessWidget {
  const Cartlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "CartList",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Cartlistwidget();
                }),
          ),
          Text("asdf")
        ],
      ),
    );
  }
}
