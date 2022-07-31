import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vendor_app/singleton/singletonConsts.dart';

class ApiBaseHelper with ChangeNotifier {
  late int ApistatusCode;

  int get getApistatusCode => ApistatusCode;

  set setApistatusCode(int newApistatusCode) {
    ApistatusCode = newApistatusCode;
    notifyListeners();
  }

  ApiBaseHelper({
    required this.url,
  });
  String url;

  getMethod() async {
    String username = 'TAFdokan';
    String password = 'HnaSXFwr3627)jruLL';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    http.Response r = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'authorization': basicAuth,
        'Cache-Control': 'no-cache',
        'accept': 'application/json',
        'Postman-token': '2518adad-8135-9904-9107-e62f39c4126f'
      },
    );

    print(r.statusCode);
    var jsonData = jsonDecode(r.body);

    return jsonData;
  }

  getAuth(String Dokusername, String Dokpassword) async {
    String username = Dokusername;
    String password = Dokpassword;
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    http.Response r = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'authorization': basicAuth,
        'Cache-Control': 'no-cache',
        'accept': 'application/json',
        'Postman-token': '2518adad-8135-9904-9107-e62f39c4126f'
      },
    );

    if (r.statusCode == 200) {
      print("USer Logged in ");
      Singleton().ApiStatusCode = r.statusCode;
      print(r.statusCode);
    } else {
      Singleton().ApiStatusCode = r.statusCode;
    }
    // ApistatusCode = r.statusCode;
    // ApistatusCode = r.statusCode;

    var jsonData = jsonDecode(r.body);
    return jsonData;
  }

  Future<dynamic> postMethod({Map<String, dynamic>? body}) async {
    var jsonBody = json.encode(body);

    print(body);
    String? username = Singleton().username;
    String? password = Singleton().password;
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    http.Response r = await http.post(Uri.parse(url),
        body: json.encode(body),
        headers: <String, String>{
          'authorization': basicAuth,
          'Cache-Control': 'no-cache',
          'Content-Type': 'application/json',
        });
    print(r);
    print(r.statusCode);
    Singleton().ApiStatusCode = r.statusCode;

    var jsonData = jsonDecode(r.body);
    return jsonData;
  }
}
