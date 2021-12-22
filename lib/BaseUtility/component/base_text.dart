import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  String title;

  BaseText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 30, color: Colors.pink),
    );
  }
}
