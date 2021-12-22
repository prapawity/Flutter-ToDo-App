import 'package:flutter/material.dart';
import 'package:todo_application/model/todo_model.dart';
import 'dart:math' as math;

class ToDoListViewWidget extends StatelessWidget {
  final List<TodoModel>? model;
  final TodoType? type;
  const ToDoListViewWidget({Key? key, required this.model, required this.type})
      : super(key: key);

  Color _genereteColor() {
    switch (type) {
      case TodoType.general:
        return Colors.purple;
      case TodoType.food:
        return Colors.pink;
      case TodoType.travel:
        return Colors.blue;
      default:
        return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        itemCount: model?.length ?? 0,
        itemBuilder: (buildContext, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                  color: _genereteColor(),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              padding: const EdgeInsets.all(8),
              height: 150,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  model?[index].name ?? "",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
  }
}
