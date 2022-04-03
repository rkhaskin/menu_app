import 'package:flutter/material.dart';
import './main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreenBottom extends StatefulWidget {
  final List<Meal> _favorites;
  const TabsScreenBottom(this._favorites, {Key? key}) : super(key: key);

  @override
  State<TabsScreenBottom> createState() => _TabsScreenBottomState();
}

class _TabsScreenBottomState extends State<TabsScreenBottom> {
  List<Map<String, Object>> _pages = [];

  int _selectedTabIndex = 0;
  void _onSelectTabHandler(selectedTabIndex) {
    setState(() {
      _selectedTabIndex = selectedTabIndex;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': const Text('Categories'),
      },
      {
        'page': FavoritesScreen(widget._favorites),
        'title': const Text('Favorites'),
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: _pages[_selectedTabIndex]['title'] as Widget),
      body: _pages[_selectedTabIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedTabIndex,
          onTap: _onSelectTabHandler,
          items: const [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
