import 'package:expense_tracker/key/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class KeyTest extends StatefulWidget {
  const KeyTest({super.key});
  @override
  State<KeyTest> createState() {
    return _KeyTestState();
  }
}

class _KeyTestState extends State<KeyTest> {
  String order = 'asc';
  final todoList = const [
    Todo('Flutter Course', Priority.urgent),
    Todo('Postman Course', Priority.low),
    Todo('Andrea Flutter Course', Priority.normal),
    Todo('Bloc Flutter Course', Priority.normal)
  ];

  void changeOrder() {
    setState(() {
      order = order == 'asc' ? 'des' : 'asc';
    });
  }

  List<Todo> get sortedTodo {
    var newList = List.of(todoList);
    newList.sort((a, b) {
      final bComeAfterA = a.text.compareTo(b.text);
      return order == 'asc' ? bComeAfterA : -bComeAfterA;
    });
    return newList;
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: changeOrder,
              label: Text(order == 'asc' ? 'Ascending' : 'Descending'),
              icon: Icon(
                  order == 'asc' ? Icons.arrow_upward : Icons.arrow_downward),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          for (var item in sortedTodo)
            CheckableTodoItem(
              key: ValueKey(item.text),
              item.text,
              item.priority,
            )
        ],
      )),
    );
  }
}
