import 'package:flutter/material.dart';
import 'package:notebook/widgets/task_list.dart';
import 'package:notebook/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:notebook/models/task_data.dart';
import 'info.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    initFunction();
  }

  Future initFunction() async {
    await context.read<Data>().loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 65, left: 30, right: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notebook',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${context.watch<Data>().taskCount} Tasks',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: const Color(0xFFffaf42),
                      width: 2.0,
                    ),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {
                      Info().onBasicAlertPressed(context);
                    },
                    shape: CircleBorder(),
                    child: const Icon(
                      Icons.list,
                      size: 30,
                      color: Color(0xFFffaf42),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddTaskScreen(),
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add_task,
                    size: 35,
                    color: Color(0xFFffaf42),
                  ), // icon user//IconButton
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
