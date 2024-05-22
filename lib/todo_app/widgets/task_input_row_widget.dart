import 'package:flutter/material.dart';

class TaskInputRowWidget extends StatefulWidget {
  const TaskInputRowWidget(
      {super.key, required this.onTaskAdded, required this.textController});

  final void Function(String) onTaskAdded;
  final TextEditingController textController;

  @override
  State<TaskInputRowWidget> createState() => _TaskInputRowWidgetState();
}

class _TaskInputRowWidgetState extends State<TaskInputRowWidget> {
  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

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
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  widget.onTaskAdded(value);
                  widget.textController.clear();
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
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
              onPressed: () {
                if (widget.textController.text.isNotEmpty) {
                  widget.onTaskAdded(widget.textController.text);
                  widget.textController.clear();
                }
              },
              child: const Icon(Icons.play_arrow),
            ),
          )
        ],
      ),
    );
  }
}
