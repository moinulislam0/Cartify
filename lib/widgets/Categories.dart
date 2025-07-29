import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/controller/SmartphoneController.dart';

import 'package:practice_method/controller/beautyController.dart';
import 'package:practice_method/controller/categoriesController.dart';
import 'package:practice_method/controller/fragrancesController.dart';


import 'package:practice_method/view/beautyScreen.dart';
import 'package:practice_method/view/fragranceScreen.dart';
import 'package:practice_method/view/smartphoneScreen.dart';
// You'll create this to show smartphone data

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? selectedCategoris;

  Map<String, List<String>> categoryData = {};

  @override
  void initState() {
    super.initState();
    Get.find<Categoriescontroller>().getCategories();
    Get.find<Smartphonecontroller>().getSmartphone();
    Get.find<Beautycontroller>().getBeauty();
    Get.find<FragrancesController>().getFragrances();
  }

  @override
  Widget build(BuildContext context) {
    final itemsToShow = categoryData[selectedCategoris] ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<Categoriescontroller>(builder: (category) {
              final item = category.categoriesModel.categories;
              return Row(
                children: item.map((category) {
                  final isSelected = selectedCategoris == category.name;
                  return TextButton(
                    onPressed: () async {
                      setState(() {
                        selectedCategoris = category.name ?? '';
                      });

                      // Fetch smartphone data if 'Smartphones' is selected
                      // if (selectedCategoris == 'Smartphones') {
                      //   await Get.find<Smartphonecontroller>().getSmartphone();
                      // } else if (selectedCategoris == 'Beauty') {
                      //   await Get.find<Beautycontroller>().getBeauty();
                      // } else if (selectedCategoris == 'Fragrances') {
                      //   await Get.find<FragrancesController>().getFragrances();
                      // }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          category.name ?? '',
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (isSelected) SizedBox(height: 4),
                        if (isSelected)
                          Container(
                            height: 2,
                            width: 40,
                            color: Colors.pink,
                          ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          const SizedBox(height: 10),
          if (selectedCategoris == 'Smartphones')
            Smartphonescreen()
          else if (selectedCategoris == 'Beauty')
            Beautyscreen()
          else if (selectedCategoris == 'Fragrances')
            Fragrancescreen()
          else
            Center(child: Text("No data"))
        ],
      ),
    );
  }
}
