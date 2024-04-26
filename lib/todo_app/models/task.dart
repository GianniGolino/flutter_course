import 'dart:convert';

class Task {
  Task(
      {required this.text,
      required this.isStarred,
      required this.id,
      required this.isEditing});

  String text;
  bool isStarred;
  int id;
  bool isEditing;

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isStarred': isStarred,
      'id': id,
      'isEditing': isEditing,
    };
  }

  factory Task.fromJson(String json) {
    return Task.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  // Create Task object from JSON map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      text: map['text'] as String,
      isStarred: map['isStarred'] as bool,
      id: map['id'] as int,
      isEditing: map['isEditing'] as bool,
    );
  }
}
