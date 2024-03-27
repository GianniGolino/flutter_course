import 'package:flutter/material.dart';
import 'package:flutter_animations/model/task_item.dart';

class TaskInputRowWidget extends StatefulWidget {
  const TaskInputRowWidget(
      {super.key,
      required this.tasks,
      required this.tasksIDIndex,
      required this.textController});

  final List<TaskItem> tasks;
  final int tasksIDIndex;
  final TextEditingController textController;

  @override
  State<TaskInputRowWidget> createState() => _TaskInputRowWidgetState();
}

class _TaskInputRowWidgetState extends State<TaskInputRowWidget> {
  int _localTasksIDIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 44,
            child: TextField(
              controller: widget.textController,
              //adding tasks through the keyboard
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    widget.tasks.add(TaskItem(widget.textController.text, false,
                        _localTasksIDIndex, false));
                    _localTasksIDIndex++;
                    widget.textController.clear();
                    widget.textController.text = "";
                  });
                }
              },
              textInputAction: TextInputAction.done,
              //textField layout
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
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
                  if (widget.textController.text.isNotEmpty) {
                    widget.tasks.add(TaskItem(widget.textController.text, false,
                        _localTasksIDIndex, false));
                    _localTasksIDIndex++;
                    //isStarred.add(false);
                    widget.textController.clear();
                    widget.textController.text = "";

                    FocusScope.of(context).unfocus();
                  }
                });
              },
              child: const Icon(Icons.play_arrow),
            ),
          )
        ],
      ),
    );
  }
}
