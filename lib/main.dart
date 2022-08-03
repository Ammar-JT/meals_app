// Lesson 8: Drawer + replacing pages (instead of pushing to the stack of pages)

//Drawer:
//    - you can make a drawer very simply, under any Scaffold put Drawer: Scaffold(drawer:...)
//    - we made a widget for the drawer, so it will be reusable in any screen
//    - the drawer in this lesson is used in tabs_screen
//    - no need to explain the logic, it's very simple, go and see it in main_drawer

// replacing pages (instead of pushing to the stack of pages):
//      - simply replace any pushNamed() with pushReplacementNamed()

import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        // '/categories': (ctx) => CategoryMealsScreen(categoryId, categoryTitle) << we dont have id and title, so we will reomve the constructor in category_meals_screen and change the mechanism:
        // '/categories': (ctx) => CategoryMealsScreen() << a hardcoded way
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(), // << a non-hardcoded way
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      //this will work for any named (pushNamed) navigation that is not registered in routes up here ^
      //.. this is typically does some logic depends on the setting or arguments
      //.. and if it failed to navigated, it will keep it for the onUnknownRoute
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

      //same as onGenerateRoute, but it's the last hope for routing,
      //.. typically used like 404 in the web insteed of returning an exception
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
