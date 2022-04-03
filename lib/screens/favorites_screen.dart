import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favorites;

  const FavoritesScreen(this._favorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_favorites.isEmpty) {
      return const Center(child: Text('You do not have any favorites yet'));
    } else {
      return ListView.builder(
        itemCount: _favorites.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favorites[index].id,
            title: _favorites[index].title,
            imageUrl: _favorites[index].imageUrl,
            duration: _favorites[index].duration,
            complexity: _favorites[index].complexity,
            affordability: _favorites[index].affordability,
          );
        },
      );
    }
  }
}
