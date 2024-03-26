import 'package:flutter/material.dart';
import 'package:flutter_animations/model/task_item.dart';

class StarredTasksPage extends StatefulWidget {
  const StarredTasksPage({super.key, required this.starredTasks});

  final List<TaskItem> starredTasks;

  @override
  State<StarredTasksPage> createState() => _StarredTasksPageState();
}

class _StarredTasksPageState extends State<StarredTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('To do'),
      // ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Favourite tasks:',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(widget.starredTasks[index].text),
                    ],
                  );
                },
                itemCount: widget.starredTasks.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 40,
                    color: Colors.deepPurple,
                  );
                },
                padding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
