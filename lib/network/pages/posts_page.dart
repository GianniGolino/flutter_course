import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/network/models/post.dart';
import 'package:flutter_animations/network/widgets/fallback_widget.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chiamate di rete'),
        ),
        body: FutureBuilder(
            future: getPosts(),
            builder: (context, snapshot) {
              bool canProceed = Random().nextBool();
              //print(canProceed);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!canProceed) {
                return const FallbackWidget();
              } else {
                return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(snapshot.data![index].id.toString()),
                          ),
                          const Gap(16),
                          Expanded(
                            flex: 2,
                            child: Text(snapshot.data![index].title),
                          ),
                          const Gap(16),
                          Expanded(
                            flex: 2,
                            child: Text(snapshot.data![index].body),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, idnex) {
                      return const Divider();
                    },
                    itemCount: snapshot.data!.length);
              }
            }));
  }

  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);
      List<Post> posts = [];
      try {
        posts = responseData.map((data) {
          return Post.fromMap(data);
        }).toList();
      } catch (e) {
        //print(e);
      }
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
