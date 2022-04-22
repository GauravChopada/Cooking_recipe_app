import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/dummy_list.dart';
import '../Models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function _ToggleFavourite;
  final Function _IsFavourite;

  MealDetailScreen(this._ToggleFavourite, this._IsFavourite);

  static const Routename = '/Meal_Detail';
  Meal SelectedMeal;
  String get Affordabilitytext {
    switch (SelectedMeal.affordability) {
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
    switch (SelectedMeal.complexity) {
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

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;

    SelectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == id;
    });
    int stepcount = 0;

    Widget _ForDetails(bool data, String text) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(
              data ? Icons.check : Icons.close,
              color: data ? Colors.green : Colors.red,
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.white),
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
                        '${SelectedMeal.duration} min',
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
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
              // width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: Colors.black)),
                    child: Column(
                      children: [
                        _ForDetails(
                            SelectedMeal.isGlutenFree, 'Is Gluten Free ?'),
                        _ForDetails(
                            SelectedMeal.isLactoseFree, 'Is Lactose Free ?'),
                        _ForDetails(SelectedMeal.isVegan, 'Is Vegan ?'),
                        _ForDetails(
                            SelectedMeal.isVegetarian, 'Is Vegeterian ?'),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Ingrediets',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        children:
                            SelectedMeal.ingredients.map<Widget>((ingredient) {
                          return Column(
                            children: [
                              Container(
                                child: Text(
                                  ingredient,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              )
                            ],
                          );
                        }).toList(),
                      )),
                  //
                  Text(
                    'Steps ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        children: SelectedMeal.steps.map<Widget>((step) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('${++stepcount}'),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  step,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              )
                            ],
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _ToggleFavourite(id),
        child: Icon(_IsFavourite(id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
