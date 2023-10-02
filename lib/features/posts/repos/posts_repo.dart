import 'package:flutter_application_3/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostData>> fetchPosts() async {
    var client = http.Client();
    List<PostData> postData = [];

    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      postData = postDataFromJson(response.body);

      return postData;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Testing Post Request",
        "body": "I am Shiffa",
        "userId": "3231",
      });
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
