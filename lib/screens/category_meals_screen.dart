import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool loadedInitData = false;

  // @override
  // void initState() {
  //   //context not working here, cuz initState is too early before flutter getting the context of this widget
  //   final routeArgs =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   categoryTitle = routeArgs['title'];
  //   final categoryId = routeArgs['id'];
  //   // .where() is a built-in method: return the item of the list only if it satisfied the condition:
  //   displayedMeals = DUMMY_MEALS.where((meal) {
  //     //contains is another built-in function, but it return True or False if it contains the variable in the list:
  //     return meal.categories.contains(categoryId);
  //   }).toList();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      // .where() is a built-in method: return the item of the list only if it satisfied the condition:
      displayedMeals = DUMMY_MEALS.where((meal) {
        //contains is another built-in function, but it return True or False if it contains the variable in the list:
        return meal.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
