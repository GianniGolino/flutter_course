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
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Post title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            const Gap(8),

            // post body textField
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: TextField(
                controller: bodyController,
                decoration: const InputDecoration(
                    hintText: 'Post body',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            const Gap(8),

            //post userId textField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'User Id',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
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
    //TODO chiedi a Gigi - json non è utilizzato idem response se non effettuiamo il print
    String json = newPost.toJson();
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');

    try {
      Response response = await http.post(url);
      //print(response.body);
    } catch (e) {}
  }
}
