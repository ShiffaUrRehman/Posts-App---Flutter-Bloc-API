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
}
