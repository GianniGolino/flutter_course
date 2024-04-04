import 'package:flutter/material.dart';
import 'package:flutter_animations/todo_app/models/task_item.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget(
      {super.key,
      required this.tasks,
      required this.starredTasks,
      required this.editTextController});

  final TextEditingController editTextController;
  final List<TaskItem> tasks;
  final List<TaskItem> starredTasks;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
          height: 20,
          color: Colors.deepPurple,
        );
      },
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     widget.tasks[index].id.toString(),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 4),
            // ),
            Expanded(
              flex: 5,
              child: !widget.tasks[index].isEditing
                  ? Text(
                      widget.tasks[index].text,
                    )
                  : TextField(
                      controller: widget.editTextController,
                      onEditingComplete: () {
                        setState(() {
                          widget.tasks[index].text =
                              widget.editTextController.text;
                          widget.tasks[index].isEditing = false;
                        });
                        FocusScope.of(context).unfocus();
                      },
                    ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.tasks[index].isStarred) {
                      widget.starredTasks.removeWhere((starredTask) =>
                          starredTask.id == widget.tasks[index].id);
                    }
                    widget.tasks.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.tasks[index].isStarred
                        ? widget.starredTasks.removeWhere((starredTask) =>
                            starredTask.id == widget.tasks[index].id)
                        : widget.starredTasks.add(widget.tasks[index]);
                    widget.tasks[index].isStarred =
                        !widget.tasks[index].isStarred;
                  });
                },
                icon: Icon(Icons.star,
                    color: iconColorController(
                        value: widget.tasks[index].isStarred)),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: !widget.tasks[index].isEditing
                    ? const Icon(Icons.edit)
                    : const Icon(Icons.save),
                onPressed: () {
                  setState(() {
                    if (!widget.tasks[index].isEditing) {
                      // If not editable, enable editing mode and set the text
                      widget.editTextController.text = widget.tasks[index].text;
                    } else {
                      // If editable, save the edited text back to TaskItem
                      widget.tasks[index].text = widget.editTextController.text;
                    }
                    widget.tasks[index].isEditing =
                        !widget.tasks[index].isEditing;
                  });
                },
              ),
            ),
          ],
        );
      },
      padding: const EdgeInsets.all(16),
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
