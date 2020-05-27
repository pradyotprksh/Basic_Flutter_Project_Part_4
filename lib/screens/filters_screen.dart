import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermealsapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';

  final Function filterDta;
  final Map<String, bool> _filters;

  FiltersScreen(this.filterDta, this._filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(subTitle),
    );
  }

  @override
  void initState() {
    _glutenFree = widget._filters['gluten'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    _lactoseFree = widget._filters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.filterDta({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Gluten Free',
                    'Include meals which are gluten-free',
                    _glutenFree,
                    (value) => {
                          setState(() {
                            _glutenFree = value;
                          })
                        }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Include meals which are vegetarian',
                    _vegetarian,
                    (value) => {
                          setState(() {
                            _vegetarian = value;
                          })
                        }),
                _buildSwitchListTile(
                    'Vegan',
                    'Include meals which are vegan',
                    _vegan,
                    (value) => {
                          setState(() {
                            _vegan = value;
                          })
                        }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Include meals which are lactose-free',
                    _lactoseFree,
                    (value) => {
                          setState(() {
                            _lactoseFree = value;
                          })
                        })
              ],
            ),
          )
        ],
      ),
    );
  }
}
