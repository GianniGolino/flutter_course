import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/network/models/post.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  String _titleHintText = 'Post title';
  String _bodyHintText = 'Post body';
  String _userIdHintText = 'User id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New post')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //post title textField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    label: const Text('Post title'),
                    hintText: _titleHintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                onTap: () {
                  setState(() {
                    _titleHintText = '';
                  });
                },
              ),
            ),
            const Gap(8),

            // post body textField
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: TextField(
                controller: bodyController,
                decoration: InputDecoration(
                    label: const Text('Post body'),
                    hintText: _bodyHintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                onTap: () {
                  setState(() {
                    _bodyHintText = '';
                  });
                },
              ),
            ),
            const Gap(8),

            //post userId textField
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: const Text('User id'),
                    hintText: _userIdHintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                onTap: () {
                  setState(() {
                    _userIdHintText = '';
                  });
                },
              ),
            ),
            const Gap(16),
            SizedBox(
                height: 65,
                width: 345,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 200, 249, 211),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {
                      uploadPost();
                    },
                    child: const Text('Add Post'))),
          ],
        ),
      ),
    );
  }

  Future<void> uploadPost() async {
    Post newPost = Post(
        id: Random().nextInt(1000),
        body: bodyController.text,
        title: titleController.text,
        userId: int.parse(userIdController.text));
    String json = newPost.toJson();
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');

    try {
      Response response = await http.post(url);
      //print(response.body);
    } catch (e) {}
  }
}
