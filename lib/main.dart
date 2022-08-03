// Lesson 7: TabBar to Appbar + Bottom TabBar

// Adding TabBar to Appbar:
//    - use DefaultTabController(Scaffold(AppBar(Tabar[tab1, tab2]))) <<<not the exact syntax but the exact order
//    - DefaultTabController + AppBar & tabs + TabBarView = are connect by default behind the scene
//    .. so when you click on a tab the tabBarView will respond, all that happend under the DefaultTabController
//    - Add your screens in TabBarView
//    - now make the default screen route here: TabsScreen instead of CategoriesScreen
//    - Now you can delete the Scaffold in CategoriesScreen, cuz the real boss screen here is the TabsScreen ;)

// Bottom TabBar:
//    - in tabs_screen stateful widget
//    - in tabs_screen remove DefaultTabController() and use a scaffold directally
//    - use Scaffold(,,BottomNavigationBar(items[BottomNavigationBarItem1,DefaultTabController2]))
//
//    - unlike the top AppBar, nothing automatic here, there is no DefaultTabController()!!!
//    - the tapbar must have onTab, and the logic is manual!
//    - you have to make a function to switch between screens, and you must you setState() on it!
//    - you should use list of map to pass data to the BottomNavigationBar (screens widget + titles)
//
//    - all the logic will be found on tabs_screen.dart
import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
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
        '/': (ctx) => TabsScreen(),
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
