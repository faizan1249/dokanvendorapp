import 'dart:convert';

import 'package:http/http.dart';

class ApiBaseHelper {
  getMethod() async {
    String username = 'TAFdokan';
    String password = 'HnaSXFwr3627)jruLL';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await get(
      Uri.parse('https://bgentlemen.com/wp-json/wc/v3/products/categories/'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Cache-Control': 'no-cache',
        'accept': 'application/json',
      },
    );

    print(r.statusCode);
    var jsonData = jsonDecode(r.body);
    return jsonData;

    // var catName = jsonData[0]['name'];

    // print(catName);
  }

  Future<dynamic> postMethod({Map<dynamic, dynamic>? body}) async {
    String username = 'tayyab';
    String password = 'tayyab99';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await post(
      Uri.parse('https://bgentlemen.com/wp-json/dokan/v1/products/'),
      body: json.encode(body),
      headers: <String, String>{
        'authorization': basicAuth,
        'Cache-Control': 'no-cache',
        'accept': 'application/json',
        // 'Content-Type': 'x-www-form-urlencoded',
      },
    );

    print(r.statusCode);
    var jsonData = jsonDecode(r.body);
    return jsonData;

    // var catName = jsonData[0]['name'];

    // print(catName);
  }
}
