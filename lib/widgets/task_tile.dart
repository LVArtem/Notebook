import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTile,
    required this.checkboxCallback,
    required this.remove,
  });

  final bool isChecked;
  final String taskTile;
  final Function(bool?) checkboxCallback;
  final Function() remove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        remove();
      },
      background: Container(
        color: const Color(0xFFffaf42).withValues(alpha: 0.1),
        child: const Icon(Icons.delete),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: ListTile(
          // onLongPress: remove,
          title: Text(
            taskTile,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: const Color(0xFFffaf42),
            value: isChecked,
            onChanged: checkboxCallback,
          ),
        ),
      ),
    );
  }
}
