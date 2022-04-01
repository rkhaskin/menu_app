import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var categoryItemsList = DUMMY_CATEGORIES
        .map((catData) => CategoryItem(
              id: catData.id,
              title: catData.title,
              color: catData.color,
            ))
        .toList();
    // return a grid of all our categories
    return GridView(
      padding: const EdgeInsets.all(25),
      children: categoryItemsList,
      // define dimensions for each CategoryItem
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250, // width of each CategoryItem
        childAspectRatio: 3 / 2, // 1.5 - for 200 width we want 300 height
        crossAxisSpacing: 20, // hor spacing between CategoryItem widgets
        mainAxisSpacing: 20, // vertical spacing between CategoryItem widgets
      ),
    );
  }
}
