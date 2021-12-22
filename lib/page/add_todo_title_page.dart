import 'package:flutter/material.dart';
import 'package:todo_application/model/todo_model.dart';

class AddTodoTitlePage extends StatefulWidget {
  const AddTodoTitlePage({Key? key}) : super(key: key);

  @override
  _AddTodoTitlePageState createState() => _AddTodoTitlePageState();
}

class _AddTodoTitlePageState extends State<AddTodoTitlePage> {
  String dropdownValue = TodoType.general.name.toString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameTodoController = TextEditingController();
  _dismissPage(BuildContext context) {
    Navigator.pop(context);
  }

  _saveTodoSuccess(BuildContext context) {
    Navigator.pop(
        context,
        TodoModel(
            nameTodoController.text,
            TodoType.values.firstWhere(
                (element) => element.name.toString() == dropdownValue)));
  }

  List<DropdownMenuItem<String>> _getDropDownList() {
    return TodoType.values.map((value) {
      return DropdownMenuItem<String>(
        value: value.name,
        child: Text(value.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => _dismissPage(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: nameTodoController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: _getDropDownList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveTodoSuccess(context);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
