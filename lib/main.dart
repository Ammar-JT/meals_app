// Lesson 1: Make ur first screen + Change the startign screen + Make the widget a screen + Navigation and Routing!

// Make ur first screen + set up the project:
//    - just make a new widget called categories_screen
//    - put a GridView inside it
//    - make a class called category in model folder (to make every category an object)
//    - make category_item widget (which will be under the categories_screen)
//    - put the dummy_data.dart in the lib 
//    - In categroies_screen: import dummy + category_item and use them!


// Change the startign screen:
//    - in MaterialApp(home: هنا) <<<< put the starting screen widget


// Make the widget a screen
//    - Screen / widget / page === all the same
//    - Typically the Scaffold represent a screen, so you'll use it in every screen
//    - Put the Scaffold in categories_screen, and put the gridView inside it
//    - complete the Scaffold set up: appBar, .....etc
//    - style the screen and its children


// Navigation and Routing:
//    - make a new widget screen called category_meals_screen
//    - make it a screen by wraping the content in Scaffold
//    - make the category_item tappable using: GestureDetector or InkWell (GestureDetector with effects))
//    - write a function for selectCategory and trigger it using onTap of the InkWell
//    - use Navigator + MaterialPageRoute : in the selectCategory() function!
//    - Congrats!!! for your first navigation and routing ever!!


import 'package:flutter/material.dart';
import 'package:meal_app/categories_screen.dart';

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
          bodySmall: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: CategoriesScreen(),
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
