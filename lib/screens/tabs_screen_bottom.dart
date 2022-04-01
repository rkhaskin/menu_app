import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreenBottom extends StatefulWidget {
  const TabsScreenBottom({Key? key}) : super(key: key);

  @override
  State<TabsScreenBottom> createState() => _TabsScreenBottomState();
}

class _TabsScreenBottomState extends State<TabsScreenBottom> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': const Text('Categories'),
    },
    {
      'page': const FavoritesScreen(),
      'title': const Text('Favorites'),
    }
  ];

  int _selectedTabIndex = 0;
  void _onSelectTabHandler(selectedTabIndex) {
    setState(() {
      _selectedTabIndex = selectedTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
