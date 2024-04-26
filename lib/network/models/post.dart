import 'dart:convert';

class Post {
  Post({
    required this.id,
    required this.body,
    required this.title,
    required this.userId,
  });

  final int id;
  final String body;
  final String title;
  final int userId;

  factory Post.fromJson(String json) {
    return Post.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  String toJson() {
    return jsonEncode(toMap());
  }
}
