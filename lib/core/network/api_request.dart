import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestType {
  static const String Get = "get";
  static const String Post = "post";
  static const String Put = "put";
  static const String Delete = "delete";

}

class Api {
  //singleton
  static final Api _apiInstance = Api._internal();
  Api._internal();
  static Api get instance => _apiInstance;

  Future<dynamic> apiRequest(
      String type,
      String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      ) async {
    final _url = url;
    final _body = body == null ? null : json.encode(body);

    http.Response? response ;
    final Map<String, String> header = headers !=null ?headers: {"Content-Type": "application/json", "Accept": "application/json"};
    try {
      var url =
      Uri.parse(_url);
      switch (type) {
        case RequestType.Get:
          {
            response = await http.get(url, headers: header);
          }
          break;
        case RequestType.Post:
          {
            response = await http.post(url, headers: header, body: _body);
          }
          break;
        case RequestType.Put:
          {
            response = await http.put(url, headers: header, body: _body);
          }
          break;
        case RequestType.Delete:
          {
            response = await http.delete(url, headers: header);
          }
          break;
        default:
          break;
      }

      if (response!.statusCode == 200) {
        return json
            .decode(utf8.decode(response.bodyBytes)); //map of string dynamic...
      } else if (response.statusCode == 400) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        return json.decode(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      print("ERROR in http $type for $_url: \n" + e.toString());
    }
  }



}