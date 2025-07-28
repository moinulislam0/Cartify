import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_method/controller/beautyController.dart';
import 'package:practice_method/controller/categoriesController.dart';
import 'package:practice_method/controller/smartphoneController.dart';
import 'package:practice_method/widgets/BeautyWidgets.dart';
import 'package:practice_method/widgets/Card.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final itemsToShow = categoryData[selectedCategoris] ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          /// ========== Top Category List ================
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
                      if (selectedCategoris == 'Smartphones') {
                        await Get.find<Smartphonecontroller>().getSmartphone();
                      } else if (selectedCategoris == 'Beauty') {
                        await Get.find<Beautycontroller>().getBeauty();
                      }
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

          /// ========== Product Grid Based on Selected Category ===========
          if (selectedCategoris == 'Smartphones')
            GetBuilder<Smartphonecontroller>(
              builder: (smartCtrl) {
                if (smartCtrl.smartphoneIndecator) {
                  return const CircularProgressIndicator();
                }

                final items = smartCtrl.smartPhoneModel.products ?? [];

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = items[index];
                    return CardWidgets(item: product);
                  },
                );
              },
            )
          else if (selectedCategoris == 'Beauty')
            GetBuilder<Beautycontroller>(
              builder: (beautyCtrl) {
                if (beautyCtrl.beatyIndecator) {
                  return const CircularProgressIndicator();
                }

                final items = beautyCtrl.beautyModel.products ?? [];

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = items[index];
                    return Beautywidgets(item: product);
                  },
                );
              },
            )
          else
            Center(child: Text("No data"))
        ],
      ),
    );
  }
}
