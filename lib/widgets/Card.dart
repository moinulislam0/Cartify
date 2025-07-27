import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/detailsPage.dart';
import 'package:practice_method/view/wishList.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({
    super.key,
    required this.category,
  });

  // ignore: prefer_typing_uninitialized_variables
  final String category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Detailspage());
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.pink.withAlpha(75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: const Color.fromARGB(255, 241, 234, 234),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(
                          'assets/images/card_images.PNG',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "${category} Lime Combo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, right: 10, left: 10),
                child: Wrap(
                  children: [Icon(Icons.star), Text("4.5")],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(
                        "Price :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text("\$ 2000")
                    ]),
                    IconButton(
                        onPressed: () {
                          Get.to(() => Wishlist());
                        },
                        icon: Icon(Icons.favorite))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
