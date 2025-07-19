import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/CartList.dart';
import 'package:practice_method/widgets/stepperCount.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  List<Color> colors = [Colors.indigo, Colors.blueGrey, Colors.brown];
  Color? selectedColors;
  List<String> sizes = ["6.3", "6.4", "6.5", "6.6"];
  String selectedSizes = '';
  @override
  Widget build(BuildContext context) {
    var isSelected = selectedColors == colors;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Details Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                "assets/images/card_images.PNG",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name : Iphone",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Steppercount(
                          onIncrement: (int currentValue) {},
                          onDecrement: (int currentValue) {})
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: [Icon(Icons.star), Text("4.5")],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(onTap: () {}, child: Text("Review"))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Select Colors ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Row(
                    children: colors.map((color) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              selectedColors = color;
                              setState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: color,
                              radius: 19,
                              child: Visibility(
                                  visible: selectedColors == color,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )),
                            )),
                      );
                    }).toList(),
                  ),
                  Text(
                    "Select Size",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Row(
                    children: sizes.map((size) {
                      var isSelectedSize = selectedSizes == size;
                      return InkWell(
                        onTap: () {
                          selectedSizes = size;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: isSelectedSize
                                    ? Colors.pink
                                    : Colors.blueGrey),
                            child: Visibility(
                                visible: true,
                                child: Center(
                                  child: Text(
                                    size,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Describe ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "iPhones  are a line of smartphones developed and marketed by Apple Inc. They run on iOS, Apple's mobile  operating system. The first iPhone was released in 2007, and Apple has since released new models annually, with the latest being the iPhone 16 series.",
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4))),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 18, right: 8, left: 8, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(" \$15000", style: TextStyle(color: Colors.white))
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(Cartlist());
                        },
                        child: Text("Add to cart"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
