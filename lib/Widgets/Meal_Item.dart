import 'package:flutter/material.dart';

import '../Models/Meal.dart';
import '../Screens/Meal_Detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  void MealDetail(context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.Routename, arguments: meal.id);
  }

  String get Affordabilitytext {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
    }
  }

  String get Complexitytext {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Easy';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MealDetail(context),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${meal.duration} min',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        Complexitytext,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_rounded),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        Affordabilitytext,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
