import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/payment.dart';
import 'package:practice_method/widgets/CartListWidget.dart';

class Cartlist extends StatelessWidget {
  final String? thumbail;
  final String? title;
  final Color? color;
  final String? price;
  final String? description;

  Cartlist({
    super.key,
    this.thumbail,
    this.title,
    this.color,
    this.price,
    this.description,
  });

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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Cartlistwidget(
                    price: price,
                    thumbail: thumbail,
                    title: title,
                    description: description,
                    color: color,
                  );
                }),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => PaymentScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        "CheckOut",
                        style: TextStyle(color: Colors.pink),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
