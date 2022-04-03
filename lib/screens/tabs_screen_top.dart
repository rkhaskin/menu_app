import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import './main_drawer.dart';
import '../models/meal.dart';

class TabsScreenTop extends StatefulWidget {
  final List<Meal> _favorites;
  const TabsScreenTop(this._favorites, {Key? key}) : super(key: key);

  @override
  State<TabsScreenTop> createState() => _TabsScreenTopState();
}

class _TabsScreenTopState extends State<TabsScreenTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          drawer: const MainDrawer(),
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            const CategoriesScreen(),
            FavoritesScreen(widget._favorites),
          ]),
        ));
  }
}
