import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isMealFavorite, {Key? key})
      : super(key: key);

  static const String routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    var ingredients = [
      // show image
      SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
      ),
      // show ingredients
      buildSectionTitle(context, 'Ingredients'),
      buildContainer(
        ListView.builder(
            itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
            itemCount: selectedMeal.ingredients.length),
      ),
      // show steps
      buildSectionTitle(context, 'Steps'),
      buildContainer(ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Text('# ${index + 1}')),
              title: Text(selectedMeal.steps[index]),
            ),
            const Divider(),
          ],
        ),
        itemCount: selectedMeal.steps.length,
      ))
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        // need this widget to allow scrolling and prevent overflow
        child: Column(
          children: ingredients,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
