enum TodoType { general, food, travel }

class TodoModel {
  String name;
  TodoType type;

  TodoModel(this.name, this.type);
}
