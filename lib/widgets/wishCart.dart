import 'package:flutter/material.dart';

class Wishcart extends StatelessWidget {
  const Wishcart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(75),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/card_images.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Most Beautiful Good  Quality Products For Every Person",
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.close))
                      ],
                    ),
                    Row(
                      children: [
                        Text("4.2", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "৳ 700",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.shopping_cart))
                      ],
                    )
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
