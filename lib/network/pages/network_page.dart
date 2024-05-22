import 'package:flutter/material.dart';
import 'package:flutter_animations/network/models/post.dart';
import 'package:flutter_animations/network/pages/new_post_page.dart';
import 'package:flutter_animations/network/pages/posts_page.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chiamate di rete'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: FutureBuilder(
            future: requestPost(),
            builder: (context, data) {
              return data.hasData &&
                      data.connectionState == ConnectionState.done
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                (data.data!.id.toString()),
                              ),
                            ),
                            const Gap(16),
                            Flexible(
                              flex: 2,
                              child: Text(
                                data.data!.title,
                              ),
                            ),
                            const Gap(16),
                            Flexible(
                              flex: 2,
                              child: Text(
                                data.data!.body,
                              ),
                            )
                          ],
                        ),
                        const Gap(32),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const PostsPage(),
                                ));
                              },
                              child: const Text('All posts')),
                        ),
                        const Gap(8),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const NewPostPage(),
                                ));
                              },
                              child: const Text('Add a new post')),
                        )
                      ],
                    )
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Future<Post> requestPost() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');

    if (prefs.containsKey('post')) {
      // estrarre contenuto di prefs - getString
      String response = prefs.getString('post') ?? '';
      //print('the post was already here');
      return Post.fromJson(response);
    } else {
      Response response = await http.get(url);
      await prefs.setString('post', response.body);
      //print('the post has been just downloaded');
      return Post.fromJson(response.body);
    }
  }
}
