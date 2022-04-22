import 'package:flutter/material.dart';

import 'Screens/TabsScreen.dart';
import 'Screens/Catagary_Item_Screen.dart';
import 'Screens/Meal_Detail_screen.dart';
import 'Screens/Filters_Screen.dart';

import 'Models/dummy_list.dart';
import 'Models/Meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _Filters = {
    'Gluten': false,
    'Lectose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> MealsList = DUMMY_MEALS;
  List<Meal> FavouriteMeal = [];

  void _selectedFilter(Map<String, bool> filterdata) {
    setState(() {
      _Filters = filterdata;

      MealsList = DUMMY_MEALS.where((meal) {
        if (_Filters['Gluten'] && !meal.isGlutenFree) return false;
        if (_Filters['Lectose'] && !meal.isLactoseFree) return false;
        if (_Filters['Vegan'] && !meal.isVegan) return false;
        if (_Filters['Vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _ToggleFavourite(String mealId) {
    final ExistingIndex = FavouriteMeal.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (ExistingIndex >= 0)
        FavouriteMeal.removeAt(ExistingIndex);
      else
        FavouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }

  bool _isFavourite(String mealId) {
    return FavouriteMeal.any((meal) => mealId == meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: CategariesScreen(),
      initialRoute: '/',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amberAccent,
          canvasColor: Colors.grey[100],
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                // bodyText1: TextStyle(color: Colors.yellow),
                // bodyText2: TextStyle(color: Colors.yellow),
                title: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                ),
              )),
      title: 'International Dhaba',
      routes: {
        '/': (ctx) => TabsScreen(FavouriteMeal),
        CatagaryItemScreen.Routename: (ctx) => CatagaryItemScreen(MealsList),
        MealDetailScreen.Routename: (ctx) =>
            MealDetailScreen(_ToggleFavourite, _isFavourite),
        FilterScreen.Routename: (ctx) =>
            FilterScreen(_Filters, _selectedFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CatagaryItemScreen(MealsList));
      },
    );
  }
}
