import 'package:flutter/material.dart';
import 'package:flutter_animations/todo_app/pages/starred_tasks_page.dart';
import 'package:flutter_animations/todo_app/models/task_item.dart';
import 'package:flutter_animations/todo_app/widgets/bottom_navigationbar_widget.dart';
import 'package:flutter_animations/todo_app/widgets/header_widget.dart';
import 'package:flutter_animations/todo_app/widgets/listview_widget.dart';
import 'package:flutter_animations/todo_app/widgets/task_input_row_widget.dart';
import 'package:flutter_animations/todo_app/widgets/title_row_widget.dart';

class ToDoAppPage extends StatefulWidget {
  const ToDoAppPage({super.key});

  @override
  State<ToDoAppPage> createState() => _ToDoAppPageState();
}

class _ToDoAppPageState extends State<ToDoAppPage> {
  final textController = TextEditingController();
  final editTextController = TextEditingController();
  final List<TaskItem> tasks = [];
  int navigationIndex = 0;
  int tasksIDIndex = 0;

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

  Widget _buildTasksPage() {
    return Center(
      child: Column(
        children: [
          TaskInputRowWidget(
              onTaskAdded: (taskName) {
                setState(() {
                  tasks.add(
                    TaskItem(taskName, false, tasksIDIndex, false),
                  );
                  tasksIDIndex++;
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
                editTextController: editTextController),
          ),
        ],
      ),
    );
  }

  List<TaskItem> getStarredTasks() {
    return tasks.where((task) => task.isStarred).toList();
  }
}
