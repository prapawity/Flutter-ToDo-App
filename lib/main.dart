import 'package:flutter/material.dart';
import 'package:todo_application/BaseUtility/routers.dart' as router;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      initialRoute: "/",
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
