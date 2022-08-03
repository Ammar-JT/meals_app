// Lesson 5:  Added meal_detail_screen (with route and navigator) + onGenerateRoute + onUnknownRoute

// Added meal_detail_screen (with route and navigator):
//    - Added meal_detail_screen widget
//    - added a static const routeName = '/meal-detail'; << inside the screen widget
//    - added route for this screen here in the main
//    - used Scaffold for meal_detail_screen widget to make it screen
//    - put selectMeal() function inside meal_item, and used a Navigator inside it
//    ..so when you tap on the image of the meal it will navigate to the meal_detail_screen <<< go and see it!
//    ..also passed the id of the meal from category to meal item to meal_detail

// onGenerateRoute:
//    - the benifit of this function is to do a logic for any named (pushNamed) navigation that is not registered in routes
//    .. this is typically does some logic depends on the setting or arguments
//    .. and if it failed to navigated, it will keep it for the onKnownRoute

// onUnknownRoute
//    -same as onGenerateRoute, but it's the last hope for routing, 
//    .. typically used like 404 in the web insteed of returning an exception


import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

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
        '/': (ctx) => CategoriesScreen(),
        // '/categories': (ctx) => CategoryMealsScreen(categoryId, categoryTitle) << we dont have id and title, so we will reomve the constructor in category_meals_screen and change the mechanism:
        // '/categories': (ctx) => CategoryMealsScreen() << a hardcoded way
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(), // << a non-hardcoded way
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
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

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeliMeals'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
