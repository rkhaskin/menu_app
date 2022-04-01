import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeCategoryMeals = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayMeals;
  var didChangeRan = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!didChangeRan) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      didChangeRan = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemCount: displayMeals!.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals![index].id,
            title: displayMeals![index].title,
            imageUrl: displayMeals![index].imageUrl,
            duration: displayMeals![index].duration,
            complexity: displayMeals![index].complexity,
            affordability: displayMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
