import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}




// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   final List<Map<String, Object>> _pages = [
//     {
//       'page': CategoryScreen(),
//       'title': 'Categories',
//     },
//     {
//       'page': FavouriteScreen(),
//       'title': 'Your Favourites',
//     }
//   ];
//   int _selectesPageIndex = 0;

//   void _selectPage(int index) {
//     setState(() {
//       _selectesPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_pages[_selectesPageIndex]['title']),
//       ),
//       body: _pages[_selectesPageIndex]['page'],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Theme.of(context).accentColor,
//         currentIndex: _selectesPageIndex,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: Icon(Icons.category),
//             //title: Text('Categories'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             backgroundColor: Theme.of(context).primaryColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
