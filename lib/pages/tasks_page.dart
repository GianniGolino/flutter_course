import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/starred_tasks_page.dart';
import 'package:flutter_animations/model/task_item.dart';
import 'package:flutter_animations/widgets/bottom_navigationbar_widget.dart';
import 'package:flutter_animations/widgets/header_widget.dart';
import 'package:flutter_animations/widgets/listview_widget.dart';
import 'package:flutter_animations/widgets/task_input_row_widget.dart';
import 'package:flutter_animations/widgets/title_row_widget.dart';


// TODO: apporta una modifica al nome del widget per essere coerente con quello visualizzato nel titolo dell'appBar: 
// TODO: attualmente il titolo dell'appBar è "To do app" mentre il widget si chiama TaskPage

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
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

  //to move to a different file?
  List<TaskItem> getStarredTasks() {
    return tasks.where((task) => task.isStarred).toList();
  }
}
