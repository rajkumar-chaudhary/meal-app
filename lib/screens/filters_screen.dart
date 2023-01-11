import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const MyWidget({Key key}) : super(key: key);
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue, Function OnChanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(
          description,
          style: TextStyle(color: Colors.grey),
        ),
        value: currentValue,
        onChanged: OnChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal section',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-Free',
                    'Only include gluten-free meals,',
                    _glutenFree,
                    (newvalue) {
                      setState(() {
                        _glutenFree = newvalue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactos-Free',
                    'Only include lactose-free meals,',
                    _lactoseFree,
                    (newvalue) {
                      setState(() {
                        _lactoseFree = newvalue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals,',
                    _vegan,
                    (newvalue) {
                      setState(() {
                        _vegan = newvalue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegeterian',
                    'Only include Vegeterian meals,',
                    _vegetarian,
                    (newvalue) {
                      setState(() {
                        _vegetarian = newvalue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
