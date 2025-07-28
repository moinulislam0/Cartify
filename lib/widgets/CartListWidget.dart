import 'package:flutter/material.dart';
import 'package:practice_method/widgets/stepperCount.dart';

class Cartlistwidget extends StatefulWidget {
  final String? thumbail;
  final String? title;
  final Color? color;
  final String? price;
  final String? description;
  Cartlistwidget(
      {super.key,
      this.thumbail,
      this.title,
      this.color,
      this.price,
      this.description});

  @override
  State<Cartlistwidget> createState() => _CartlistwidgetState();
}

class _CartlistwidgetState extends State<Cartlistwidget> {
  Color Selectcolors = Colors.black;
  List<Color> colors = [Colors.pink, Colors.black, Colors.blue, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 197, 196, 196))),
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.thumbail.toString(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.title ?? ''}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.description.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Color :",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: colors.map((color) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      Selectcolors = color;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 4),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: color,
                                      child: Visibility(
                                          visible: Selectcolors == color,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 8,
                                          )),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 4),
              child: Text(
                  "-------------------------------------------------------------------------------------",
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ৳ ${widget.price.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Steppercount(
                        onIncrement: (int value) {},
                        onDecrement: (int value) {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
