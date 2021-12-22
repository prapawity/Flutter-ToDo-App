import 'package:flutter/material.dart';
import 'package:todo_application/page/add_todo_title_page.dart';
import 'package:todo_application/page/cooking.dart';
import 'package:todo_application/page/home.dart';
import 'package:todo_application/page/test.dart';
import 'package:todo_application/page/todo_home_page.dart';

enum RoutePath { home, test, cooking, addToDoTitle }

Map<String, RoutePath> mapPath = {
  "/": RoutePath.home,
  "/add-todo": RoutePath.addToDoTitle,
  "/test": RoutePath.test,
  "/cooking": RoutePath.cooking
};

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutePath? path = mapPath[settings.name];

  if (path == null) {
    return MaterialPageRoute(builder: (context) => Container());
  }

  switch (path) {
    case RoutePath.home:
      return MaterialPageRoute(builder: (context) => const TodoHomePage());
    // return MaterialPageRoute(builder: (context) => const HomePage());
    case RoutePath.test:
      return MaterialPageRoute(builder: (context) => const MyStateFulPage());
    case RoutePath.cooking:
      return MaterialPageRoute(
          builder: (context) => CookingPage(
                headerName: (settings.arguments as PageClase).title,
              ),
          fullscreenDialog: true);
    case RoutePath.addToDoTitle:
      return MaterialPageRoute(
          builder: (context) => const AddTodoTitlePage(),
          fullscreenDialog: true);
  }
}
