import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/model/SmartPhoneModel.dart';
import 'package:practice_method/view/detailsPage.dart';
import 'package:practice_method/view/wishList.dart';

class CardWidgets extends StatelessWidget {
  final String? name;
  final Products? item;

  const CardWidgets({super.key, this.name, this.item});

  @override
  Widget build(BuildContext context) {
    // Use API data if available, otherwise fallback to string
    final title = item?.title ?? "$name Lime Combo";
    final price = item?.price?.toStringAsFixed(2) ?? "2000";
    final image = item?.thumbnail;
    final rating = item!.reviews?.toString();

    return InkWell(
      onTap: () {
        Get.to(() => Detailspage(
              title: title.toString(),
              id: item?.id.toString(),
              price: item?.price.toString(),
              description: item?.description,
              thumbail:item?.thumbnail,
            ));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.pink.withAlpha(75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ========= IMAGE ==========
            Container(
              width: double.infinity,
              height: 150,
              color: const Color.fromARGB(255, 241, 234, 234),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: image != null
                      ? Image.network(
                          "${image}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : Image.asset(
                          'assets/images/card_images.PNG',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// ========= TITLE ==========
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 4),

            /// ========= RATING ==========
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 1),
              child: Wrap(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text('4.5'),
                ],
              ),
            ),

            /// ========= PRICE + FAVORITE ==========
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Text(
                      "Price : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text("\$ $price")
                  ]),
                  IconButton(
                    onPressed: () {
                      Get.to(() => Wishlist());
                    },
                    icon: const Icon(Icons.favorite),
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
