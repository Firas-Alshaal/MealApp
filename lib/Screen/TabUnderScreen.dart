import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Screen/CategoryScreen.dart';
import 'package:meal_app/Screen/FavoritesScreen.dart';
import 'package:meal_app/Widget/MainDrawer.dart';

class TabUnderScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabUnderScreen(this.favoriteMeal);

  @override
  _TabUnderScreen createState() => _TabUnderScreen();
}

class _TabUnderScreen extends State<TabUnderScreen> {
  List<Map<String, Object>> _pages;

  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeal), 'title': 'Your Favorite'},
    ];
    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorites")),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
