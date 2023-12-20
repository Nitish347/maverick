import 'dart:convert';
import 'package:http/http.dart' as http;

class APIServices {
  Future<dynamic> getResponse(double ph_val, double glu) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://localhost:3000/getResponse'));
    request.body = json.encode({"ph_val": ph_val, "glu_level": glu});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var res = await response.stream.bytesToString();
      var data = json.decode(res);
      return data;
    } else {
      print(response.reasonPhrase);
    }
  }
}

class NetWorkHandler {
  static final client = http.Client();

  static Future<dynamic> postData() async {
    var data = json.encode({"ph_val": 7.9, "glu_level": 46});
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', buildUrl("getResponse"));
    request.body = json.encode(data);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var data = json.decode(res);
      print(data);
      return data;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Uri buildUrl(String endpoint) {
    String host = "http://localhost:3000/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
