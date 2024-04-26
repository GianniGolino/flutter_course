import 'package:flutter/material.dart';
import 'package:flutter_animations/todo_app/models/task.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
    required this.tasks,
    required this.starredTasks,
    required this.editTextController,
    required this.onTaskDeleted,
    required this.onTaskStarred,
  });

  final TextEditingController editTextController;
  final List<Task> tasks;
  final List<Task> starredTasks;
  final void Function() onTaskDeleted;
  final void Function() onTaskStarred;

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
                    widget.onTaskDeleted();
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

                    widget.onTaskStarred();
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
