import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_api/models.dart';

Future<List<dynamic>> getPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    // print(response.body);
    return parsePosts(response.body);
  } else {
    throw Exception('Failed to load posts');
  }
}

dynamic parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
