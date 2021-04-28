import 'dart:convert';

import 'package:daily_app/networking/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: FutureBuilder<List<Post>>(
        future: getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          print(snapshot.hasData);
          if (snapshot.hasData) {
            return PostsList(posts: snapshot.data ?? List.empty());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Post>> getAllPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print(response.body);
    if (response.statusCode == 200) {
      var parsePosts2 = parsePosts(response.body);
      print(parsePosts2);
      return parsePosts2;
    } else {
      throw ('Failed to load posts');
    }
  }

  List<Post> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: Text(posts[index].title),
          ),
          onTap: () {
            Navigator.of(context).pop(posts[index].title);
          },
        );
      },
    );
  }
}
