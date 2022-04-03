import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen_top.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen_bottom.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _filteredMeals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final index = _favorites.indexWhere((element) => element.id == mealId);
    if (index == -1) {
      setState(() {
        _favorites
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    } else {
      setState(() {
        _favorites.removeAt(index);
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favorites.any((element) => element.id == mealId);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(
                20,
                51,
                51,
                1,
              ),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(
                20,
                51,
                51,
                1,
              ),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      home: TabsScreenBottom(_favorites),
      routes: {
        CategoryMealsScreen.routeCategoryMeals: (ctx) =>
            CategoryMealsScreen(_filteredMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        // fallback
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
