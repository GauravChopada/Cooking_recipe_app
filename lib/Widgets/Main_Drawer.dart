import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/Filters_Screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget _ListTileBuilder(String title, IconData icon, Function taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 24),
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.grey[400],
            padding: EdgeInsets.only(
              top: 70,
              left: 30,
            ),
            width: double.infinity,
            height: 200,
            child: Text(
              'Cooking up..',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 11, top: 10),
            child: Column(
              children: [
                _ListTileBuilder('Meal', Icons.restaurant, () {
                  Navigator.of(context).pushNamed('/');
                }),
                Divider(),
                _ListTileBuilder('Filter', Icons.settings, () {
                  Navigator.of(context)
                      .pushReplacementNamed(FilterScreen.Routename);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
