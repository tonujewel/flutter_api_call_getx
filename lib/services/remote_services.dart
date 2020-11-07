import 'package:flutter_api_call_getx/models/comments.dart';
import 'package:flutter_api_call_getx/services/url.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Comments>> fetchComments() async {
    var response = await client.get(URL.commentsURL);

    if(response.statusCode==200){
      var jsonString = response.body;
      return commentsFromJson(jsonString);
    }else{
      return null;
    }
  }
}
