// Lesson 3: Routing + Some Routing Tricks

// Routing:
//    - in Material you can put all the routes: Material(home: home, routes: allYourRoutes)
//    - in category_item you will change Navigator.of(ctx).push() to .pushNamed() + use arguments
//    - remove the constructor in category_meals_screen, and use the pushNamed() args of category_item instead!
//    - to recieve the values passed through args, simply use ModalRoute (we used it in category_meals_screen)

// Some routing tricks:
//    - by default has a route '/', so you can remove the argument material(home:home) and put a route to home in routes
//    - you can use material(initialRoute: '/') <<< which tell the app which is the first route to run
//    - instead of hardcoded all the routes name, you can put const in every screen 
//      ... and use it in the screen and here in the material(routes:here) without instatiate the class
//      ... like this: CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
//      ... you can use it in category_item also

import 'package:flutter/material.dart';
import 'package:meal_app/categories_screen.dart';
import 'package:meal_app/category_meals_screen.dart';

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

        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(), // << a non-hardcoded way
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
