import 'package:flutter/material.dart';
import '../Models/Meal.dart';
import '../Widgets/Meal_Item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> FavouriteMeal;
  FavouritesScreen(this.FavouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (FavouriteMeal.isEmpty)
      return Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'No Favourites Found !',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 30,
            ),
          ),
        ),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(FavouriteMeal[index]);
        },
        itemCount: FavouriteMeal.length,
      );
  }
}
