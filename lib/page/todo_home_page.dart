import 'package:flutter/material.dart';
import 'package:todo_application/model/todo_model.dart';
import 'package:todo_application/page/todo_listview_widget.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage>
    with TickerProviderStateMixin {
  late List<TodoModel>? mainModel;
  final List<Tab> tabbarList = [
    const Tab(
      icon: Icon(Icons.settings),
    ),
    const Tab(
      icon: Icon(Icons.food_bank),
    ),
    const Tab(
      icon: Icon(Icons.airplane_ticket),
    )
  ];

  List<ToDoListViewWidget> _todoListWidget() {
    List<ToDoListViewWidget> data = [
      ToDoListViewWidget(
        model: mainModel
            ?.where((element) => element.type == TodoType.general)
            .toList(),
        type: TodoType.general,
      ),
      ToDoListViewWidget(
        model: mainModel
            ?.where((element) => element.type == TodoType.food)
            .toList(),
        type: TodoType.food,
      ),
      ToDoListViewWidget(
        model: mainModel
            ?.where((element) => element.type == TodoType.travel)
            .toList(),
        type: TodoType.travel,
      )
    ];
    return data;
  }

  late TabController _tabController;

  _handleDataFromSavePage(TodoModel newData) {
    var name = newData.name;
    mainModel?.add(newData);
  }

  _didTapAddButton(BuildContext context) {
    Navigator.pushNamed(context, "/add-todo")
        .then((value) => _handleDataFromSavePage(value as TodoModel));
  }

  @override
  void initState() {
    super.initState();

    mainModel = [];
    _tabController = TabController(length: tabbarList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo Page"),
        actions: [
          IconButton(
              onPressed: () => _didTapAddButton(context),
              icon: const Icon(Icons.add))
        ],
        bottom: TabBar(controller: _tabController, tabs: tabbarList),
      ),
      body: TabBarView(controller: _tabController, children: _todoListWidget()),
    );
  }
}
