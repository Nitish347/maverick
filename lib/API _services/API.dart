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

  Future<dynamic> getRecommendation(double sweet, double sour, double bitter) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://localhost:3000/recommendation'));
    request.body = json.encode({"sweet": sweet, "sour": sour, "bitter": bitter});
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
