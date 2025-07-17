import 'package:flutter/material.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({
    super.key, required this.category,
  });

  // ignore: prefer_typing_uninitialized_variables
  final String category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.pink.withAlpha(75),
        elevation: 6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 4),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.heart_broken_rounded),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  "assets/images/card_images.PNG",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Container(
            //   width: 70,
            //   height: 70,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(image: AssetImage(images)),
            //     shape: BoxShape.circle,
            //   ),
            // ),
            Text("${category} Lime Combo"),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [Icon(Icons.price_change), Text("2000")]),
                  Icon(Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
