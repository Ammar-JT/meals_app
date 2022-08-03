// Lesson 9: Popping pages & Passing data back + delete meal (temporarly from category_meal_screen when back to it using pop)

// Popping pages & Passing data back:
//      - we will make a floating button in meal_detail_screen,
//      .. this button will go back (pop the current page) but it will pass some data back
//      - use this to do the previous line:  Navigator.of(context).pop();
//
//      - if you want to pass a data pass it in pop(data)
//      ..the plain is to use the button to delete the meal from the category list temporarly
//      - To recieved that data, go to the parent page, the one that has pushNamed()
//      - and use pushNamed().then() <<<< yes, this then is like the sync functions for http requests in any language
//      .. it will do the logic after you comeback again.
//
//      - In the parent of the paraet page >> category_meals_screen << meal_detail_screen < meal_item
//      .. we did some magor changes:
//          - make it stateful
//          - used initState()
//          - initState() is not useful cuz it run too early before we got the context, so we used didChangeDependencies()
//          - Ah! fuck!! didChangeDependencies() is running in every changing, so it load the whole list of meals instead of the modified one!
//          - I did some boolean logic to apply didChangeDependencies() only once.. using the variable loadedInitData

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
