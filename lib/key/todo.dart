import 'package:flutter/material.dart';

enum Priority {
  urgent,
  normal,
  low;

  IconData get priorityIcon {
    switch (this) {
      case Priority.normal:
        return Icons.list;
      case Priority.low:
        return Icons.low_priority;
      case Priority.urgent:
        return Icons.notifications_active;
    }
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(priority.priorityIcon),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  bool? isCheck = false;

  void changeState(bool? value) {
    setState(() {
      isCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Checkbox(
            value: isCheck,
            onChanged: changeState,
          ),
          Icon(widget.priority.priorityIcon),
          const SizedBox(width: 12),
          Text(widget.text),
        ],
      ),
    );
  }
}
