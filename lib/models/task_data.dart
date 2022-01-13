import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notebook/models/tasks.dart';
import 'dart:collection';
import 'dart:convert';

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

  void saveDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> taskList =
        _tasks.map((item) => jsonEncode(item.toMap())).toList();
    pref.setStringList('key', taskList);
  }

  Future loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? taskList = pref.getStringList('key');
    _tasks = taskList!.map((item) => Task.fromMap(jsonDecode(item))).toList();
  }
}
