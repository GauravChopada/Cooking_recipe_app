import 'package:flutter/material.dart';
import '../Widgets/Main_Drawer.dart';

class FilterScreen extends StatefulWidget {
  static const Routename = '/FilterScreen';

  final Function _saveFilter;
  final Map<String, bool> Filter;
  FilterScreen(this.Filter, this._saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _LactoseFree = false;
  var _GlutenFree = false;
  var _Vegan = false;
  var _Vegetarian = false;

  @override
  void initState() {
    _GlutenFree = widget.Filter['Gluten'];
    _LactoseFree = widget.Filter['Lectose'];
    _Vegan = widget.Filter['Vegan'];
    _Vegetarian = widget.Filter['Vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Filters = {
                'Gluten': _GlutenFree,
                'Lectose': _LactoseFree,
                'Vegan': _Vegan,
                'Vegetarian': _Vegetarian,
              };
              widget._saveFilter(Filters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your meal Selection here',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
            alignment: Alignment.center,
          ),
          Expanded(
              child: Column(
            children: [
              SwitchListTile(
                title: Text(
                  'Gluten',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                value: _GlutenFree,
                subtitle: Text('Set Your meal gluten free'),
                onChanged: (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                },
                tileColor: _GlutenFree ? Colors.indigo[100] : Colors.grey[100],
                activeColor: Colors.indigo,
              ),
              SizedBox(
                height: 2,
              ),
              SwitchListTile(
                title: Text('Lactose',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                value: _LactoseFree,
                subtitle: Text('Set Your meal Lactose free'),
                tileColor: _LactoseFree ? Colors.indigo[100] : Colors.grey[100],
                activeColor: Colors.indigo,
                onChanged: (newValue) {
                  setState(() {
                    _LactoseFree = newValue;
                  });
                },
              ),
              SizedBox(
                height: 2,
              ),
              SwitchListTile(
                title: Text('Vegan',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                value: _Vegan,
                subtitle: Text('Set Your meal as Vegan'),
                tileColor: _Vegan ? Colors.indigo[100] : Colors.grey[100],
                activeColor: Colors.indigo,
                onChanged: (newValue) {
                  setState(() {
                    _Vegan = newValue;
                  });
                },
              ),
              SizedBox(
                height: 2,
              ),
              SwitchListTile(
                title: Text('Vegetarian',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                value: _Vegetarian,
                subtitle: Text('Set Your meal as Vegetarian'),
                tileColor: _Vegetarian ? Colors.indigo[100] : Colors.grey[100],
                activeColor: Colors.indigo,
                onChanged: (newValue) {
                  setState(() {
                    _Vegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
