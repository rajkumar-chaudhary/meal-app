import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';
import '../models/meals.dart';

// import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  var _initchanged = false;
  List<Meal> displayMeals;
  String CategoryTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initchanged) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      CategoryTitle = routeArgs['title'];
      final CategoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(CategoryId);
      }).toList();
      _initchanged = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String Categoryid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, item) {
          return MealItem(
            id: displayMeals[item].id,
            affordability: displayMeals[item].affordability,
            complexity: displayMeals[item].complexity,
            duration: displayMeals[item].duration,
            imageUrl: displayMeals[item].imageUrl,
            title: displayMeals[item].title,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
