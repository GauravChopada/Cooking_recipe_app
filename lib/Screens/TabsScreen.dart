import 'package:flutter/material.dart';

import './FavouriteScreen.dart';
import './Categaries_screen.dart';

import '../Widgets/Main_Drawer.dart';

import '../Models/Meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> FavouriteMeal;

  TabsScreen(this.FavouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _Pages;

  int _SelectedPageIndex = 0;

  void _SelectedPage(int index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  Color _PreferredColor() {
    if (_SelectedPageIndex == 1)
      return Colors.deepPurpleAccent;
    else
      return Colors.indigo;
  }

  @override
  void initState() {
    _Pages = [
      {'Page': CategariesScreen(), 'Title': 'Categories'},
      {
        'Page': FavouritesScreen(widget.FavouriteMeal),
        'Title': 'Your Favourites'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_Pages[_SelectedPageIndex]['Title']),
        backgroundColor: _PreferredColor(),
      ),
      drawer: MainDrawer(),
      body: _Pages[_SelectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectedPage,
        backgroundColor: Colors.indigo[900],
        currentIndex: _SelectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_SelectedPageIndex == 1
                ? Icons.category_outlined
                : Icons.category),
            title: Text('Categories'),
            backgroundColor: _PreferredColor(),
          ),
          BottomNavigationBarItem(
            icon: Icon(_SelectedPageIndex == 0
                ? Icons.star_border_outlined
                : Icons.star),
            title: Text('Favourites'),
            backgroundColor: _PreferredColor(),
          )
        ],
      ),
    );
  }
}
