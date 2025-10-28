import 'package:flutter/material.dart';
import 'package:notebook/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            cursorColor: const Color(0xFFffaf42),
            onChanged: (value) {
              newTask = value;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFffaf42)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
              context.read<Data>().addTask(newTask);
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
