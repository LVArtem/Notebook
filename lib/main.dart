import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:notebook/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Color(0xFFffaf42),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[300]),
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
