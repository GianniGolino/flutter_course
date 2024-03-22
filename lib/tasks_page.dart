import 'package:flutter/material.dart';
import 'package:flutter_animations/starred_tasks_page.dart';
import 'package:flutter_animations/task_item.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final textController = TextEditingController();
  String inputText = "";
  final List<TaskItem> tasks = [];
  final List<TaskItem> starredTasks = [];
  int navigationIndex = 0;
  int tasksIDIndex = 0;

  @override
  Widget build(BuildContext context) {
    // new change

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
        body: IndexedStack(
          index: navigationIndex,
          children: [
            _buildTasksPage(),
            StarredTasksPage(starredTasks: starredTasks),
          ],
        ),
        bottomNavigationBar: Container(
          height: 87,
          margin: const EdgeInsets.all(32),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 25,
              offset: const Offset(8, 20),
            ),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  navigationIndex = index;
                });
              },
              //type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.deepPurple,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: navigationIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'All Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Starred',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTasksPage() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 44,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        inputText = textController.text;
                      });
                    },
                    controller: textController,

                    //adding tasks through the keyboard
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          tasks.add(TaskItem(inputText, false, tasksIDIndex));
                          tasksIDIndex++;
                          textController.clear();
                          inputText = "";
                        });
                      }
                    },
                    textInputAction: TextInputAction.done,

                    //textField layout
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(
                  height: 44,
                  width: 88,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ))),
                    onPressed: () {
                      setState(() {
                        if (textController.text.isNotEmpty) {
                          tasks.add(TaskItem(inputText, false, tasksIDIndex));
                          tasksIDIndex++;
                          //isStarred.add(false);
                          textController.clear();
                          inputText = "";
                        }
                      });
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  'To do:',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 8,
                  height: 20,
                  color: Colors.deepPurple,
                );
              },
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(tasks[index].id.toString()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        tasks[index].text,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (tasks[index].isStarred) {
                            starredTasks.removeWhere((starredTask) =>
                                starredTask.id == tasks[index].id);
                          }
                          tasks.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          tasks[index].isStarred
                              ? starredTasks.removeWhere((starredTask) =>
                                  starredTask.id == tasks[index].id)
                              : starredTasks.add(tasks[index]);
                          tasks[index].isStarred = !tasks[index].isStarred;
                        });
                      },
                      icon: Icon(Icons.star,
                          color: iconColorController(
                              value: tasks[index].isStarred)),
                    )
                  ],
                );
              },

              //physics: const NeverScrollableScrollPhysics(),
              //reverse: true,
              //scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}

Color iconColorController({bool value = false}) {
  if (value == false) {
    return Colors.grey;
  } else {
    return Colors.amber;
  }
}
