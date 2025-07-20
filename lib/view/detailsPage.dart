import 'package:flutter/material.dart';
import 'package:practice_method/widgets/detialimagesWidget.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Details Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Detialimageswidget(),
            SizedBox(
              height: 10,
            ),
            Text(
              "THis Products are amazing and beautiful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)))),
            )
          ],
        ));
  }
}
