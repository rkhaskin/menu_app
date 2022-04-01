import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../screens/tabs_screen_top.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const TabsScreenTop(),
      routes: {
        CategoryMealsScreen.routeCategoryMeals: (ctx) =>
            const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
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
