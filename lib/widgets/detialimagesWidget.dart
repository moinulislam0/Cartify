import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/view/wishList.dart';

class Detialimageswidget extends StatefulWidget {
  const Detialimageswidget({super.key});

  @override
  State<Detialimageswidget> createState() => _DetialimageswidgetState();
}

class _DetialimageswidgetState extends State<Detialimageswidget> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 219, 218, 218),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Center(
              child: AnimatedScale(
                scale: isZoomed ? 1.8 : 1.0, // Zoom to 1.8x
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/card_images.PNG',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: IconButton(
                onPressed: () {
                  Get.to(() => Wishlist());
                },
                icon: const Icon(Icons.favorite_outline),
              ),
            ),
          ),
        ),
        Positioned(
          left: 34,
          bottom: 12,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isZoomed = !isZoomed;
                });
              },
              icon: Icon(
                isZoomed
                    ? Icons.center_focus_weak_outlined
                    : Icons.center_focus_strong_outlined,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
