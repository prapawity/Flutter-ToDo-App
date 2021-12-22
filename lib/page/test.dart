import 'package:flutter/material.dart';
import 'package:todo_application/BaseUtility/component/base_text.dart';

class MyStateFulPage extends StatefulWidget {
  const MyStateFulPage({Key? key}) : super(key: key);

  @override
  _MyStateFulPageState createState() => _MyStateFulPageState();
}

class _MyStateFulPageState extends State<MyStateFulPage> {
  late int? number;

  @override
  void initState() {
    number = 0;

    super.initState();
  }

  void _numberCount() {
    setState(() {
      number = (number ?? 0) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseText(
          title: "Test Page",
        ),
      ),
      body: Column(
        children: [Text(number.toString())],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 3,
        child: const Text("counter"),
        onPressed: _numberCount,
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
