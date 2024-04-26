import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animations/todo_app/pages/starred_tasks_page.dart';
import 'package:flutter_animations/todo_app/models/task.dart';
import 'package:flutter_animations/todo_app/widgets/bottom_navigationbar_widget.dart';
import 'package:flutter_animations/todo_app/widgets/header_widget.dart';
import 'package:flutter_animations/todo_app/widgets/listview_widget.dart';
import 'package:flutter_animations/todo_app/widgets/task_input_row_widget.dart';
import 'package:flutter_animations/todo_app/widgets/title_row_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoAppPage extends StatefulWidget {
  const ToDoAppPage({super.key});

  @override
  State<ToDoAppPage> createState() => _ToDoAppPageState();
}

class _ToDoAppPageState extends State<ToDoAppPage> {
  final textController = TextEditingController();
  final editTextController = TextEditingController();
  List<Task> tasks = [];
  int navigationIndex = 0;
  int tasksIDIndex = 0;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    //wrapping the scaffold in a gestureDetector, to dismiss keyboard when needed.
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            elevation: 2.0,
            title: const Text('To do app'),
          ),
          //delete all button
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 60,
              width: 60,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    tasks.clear();
                    saveTasks();
                  });
                },
                child: const Icon(Icons.folder_delete),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: IndexedStack(
            index: navigationIndex,
            children: [
              _buildTasksPage(),
              StarredTasksPage(starredTasks: getStarredTasks()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            navigationIndex: navigationIndex,
            onTap: (index) {
              setState(() {
                navigationIndex = index;
              });
            },
          )),
    );
  }

  //TODO Chiedi a Gigi
  @override
  void dispose() {
    saveTasks();
    super.dispose();
  }

  Widget _buildTasksPage() {
    return Center(
      child: Column(
        children: [
          TaskInputRowWidget(
              onTaskAdded: (taskName) {
                setState(() {
                  tasks.add(
                    Task(
                        text: taskName,
                        isStarred: false,
                        id: tasksIDIndex,
                        isEditing: false),
                  );
                  tasksIDIndex++;
                  saveTasks();
                });
              },
              textController: textController),
          // TaskInputRowWidget(
          //     tasks: tasks,
          //     tasksIDIndex: tasksIDIndex,
          //     textController: textController),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          const TitleRowWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          ),
          const HeaderWidget(),
          Expanded(
            child: ListViewWidget(
              tasks: tasks,
              starredTasks: getStarredTasks(),
              editTextController: editTextController,
              onTaskDeleted: () {
                saveTasks();
              },
              onTaskStarred: () {
                saveTasks();
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('tasks')) {
      setState(() {
        tasks.clear();
        List<dynamic> jsonList = jsonDecode(prefs.getString('tasks')!);
        for (String task in jsonList) {
          tasks.add(Task.fromJson(task));
        }
      });
    }
  }

  void saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', jsonEncode(tasks));
  }

  //   void loadTasks() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final List<String>? taskList = prefs.getStringList('tasks');
  //   if (taskList != null) {
  //     setState(() {
  //       tasks.clear();
  //       tasks.addAll(taskList.map((taskString) => Task.fromJson(taskString)));
  //     });
  //   }
  // }

  // void saveTasks() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final List<String> taskStrings =
  //       tasks.map((task) => task.toJson()).toList();
  //   await prefs.setStringList('tasks', taskStrings);
  // }

  List<Task> getStarredTasks() {
    return tasks.where((task) => task.isStarred).toList();
  }
}
