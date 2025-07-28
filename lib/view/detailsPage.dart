import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/CartList.dart';
import 'package:practice_method/widgets/detialimagesWidget.dart';
import 'package:practice_method/widgets/stepperCount.dart';

class Detailspage extends StatefulWidget {
  final String? title;
  final String? price;
  final String? description;
  final String? id;
  final String? thumbail;
  Detailspage(
      {super.key,
      this.title,
      this.price,
      this.description,
      this.id,
      this.thumbail});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  List<Color> colors = [Colors.black, Colors.blue, Colors.grey, Colors.purple];
  Color selectColors = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Details Page id ${widget.id}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Detialimageswidget(
              thumbail: widget.thumbail,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            widget.price ?? '',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "\$200",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Spacer(),
                          Steppercount(
                              onIncrement: (int currentvalue) {},
                              onDecrement: (int currentvalue) {})
                        ],
                      ),
                      SizedBox(height: 16),
                      Text("Select Color", style: TextStyle(fontSize: 16)),
                      Row(
                          children: colors.map((color) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectColors = color;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: CircleAvatar(
                              backgroundColor: color,
                              child: Visibility(
                                  visible: selectColors == color,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        );
                      }).toList()),
                      SizedBox(height: 8),
                      Row(children: []),
                      SizedBox(height: 20),
                      Text("Description", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 6),
                      Text(
                        widget.description ?? '',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => Cartlist());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price :",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            widget.price!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => Cartlist(
                                  price: widget.price,
                                  color: selectColors,
                                  title: widget.title,
                                  description: widget.description,
                                  thumbail: widget.thumbail,
                                ));
                          },
                          child: Text("Add To Cart"))
                    ],
                  )),
            )
          ],
        ));
  }
}
