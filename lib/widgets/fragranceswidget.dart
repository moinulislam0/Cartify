import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/model/FragranceModel.dart';
import 'package:practice_method/view/detailsPage.dart';

class Fragranceswidget extends StatelessWidget {
  final FragranceProducts? item;
  Fragranceswidget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    final image = item?.thumbnail ?? '';
    final price = item?.price!.toStringAsFixed(2) ?? '';
    final title = item?.title ?? '';
    final id = item?.id ?? '';
    final description = item?.description ?? '';

    return InkWell(
      onTap: () {
        Get.to(() => Detailspage(
              description: description,
              price: price,
              title: title,
              thumbail: image,
              id: id.toString(),
            ));
      },
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
            Container(
                width: double.infinity,
                height: 150,
                color: const Color.fromARGB(255, 241, 234, 234),
                child: Image.network(image.toString())),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 1),
              child: Text(
                title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 1),
              child: Wrap(children: [
                const Icon(Icons.star, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text('4.5'),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Text(
                        "Price : \$ ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(price.toString()),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
