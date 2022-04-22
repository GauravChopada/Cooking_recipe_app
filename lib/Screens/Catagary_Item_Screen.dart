import 'package:flutter/material.dart';

import '../Models/Meal.dart';
import '../Widgets/Meal_Item.dart';

class CatagaryItemScreen extends StatelessWidget {
  final List<Meal> GivenMEal;
  CatagaryItemScreen(this.GivenMEal);

  static const Routename = '/Catagary-item';
  @override
  Widget build(BuildContext context) {
    final FunArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String CatagaryId = FunArguments['Id'];
    final String CatagaryTitle = FunArguments['Title'];

    final meal = GivenMEal.where((meal) {
      return meal.categories.contains(CatagaryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(CatagaryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(meal[index]);
          },
          itemCount: meal.length,
        ));
  }
}
