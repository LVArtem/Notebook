import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:notebook/models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    saveDate();
    notifyListeners();
  }

  void updateTask(Task tasks) {
    tasks.toggleDone();
    saveDate();
    notifyListeners();
  }

  void removeTask(Object tasks) {
    _tasks.remove(tasks);
    saveDate();
    notifyListeners();
  }

  Future<void> saveDate() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String> taskList = _tasks
        .map((item) => jsonEncode(item.toMap()))
        .toList();
    await pref.setStringList('key', taskList);
  }

  Future loadData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String>? taskList = pref.getStringList('key');
    _tasks = taskList!.map((item) => Task.fromMap(jsonDecode(item))).toList();
  }
}
