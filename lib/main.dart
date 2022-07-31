// Lesson 2: Passing data between screens!

// Passing data between screens:
//    - just use constructors as always!
//    - we passed the id and title between categories_screen + category_item + categories_meals_screen




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
