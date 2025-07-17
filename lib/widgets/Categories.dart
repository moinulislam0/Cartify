import 'package:flutter/material.dart';
import 'package:practice_method/widgets/Card.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String selectedCategoris = 'Smartphones';

  List<String> categories = [
    'Smartphones',
    "Laptop",
    "Mobile",
    "Clock",
    "Car",
  ];

  Map<String, List<String>> categoryData = {
    'Smartphones': ['iPhone', 'Samsung', 'OnePlus'],
    'Laptop': ['Dell', 'HP', 'MacBook'],
    'Mobile': ['Nokia', 'Realme', 'Vivo'],
    'Clock': ['Rolex', 'Casio', 'Timex'],
    'Car': ['BMW', 'Tesla', 'Toyota'],
  };

  @override
  Widget build(BuildContext context) {
    final itemsToShow = categoryData[selectedCategoris] ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                final isSelected = selectedCategoris == category;
                return TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategoris = category;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (isSelected) SizedBox(height: 4), // Controls gap
                        if (isSelected)
                          Container(
                            height: 2,
                            width: 40, // Or match the text width if you want
                            color: Colors.pink,
                          ),
                      ],
                    ));
              }).toList(),
            ),
          ),
          SizedBox(
            // Increased height for visibility
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scroll inside
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: itemsToShow.length,
              itemBuilder: (context, index) {
                return CardWidgets(category: itemsToShow[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
