import 'dart:async';
import 'dart:convert' show json;

import 'package:app_nation_test_project/data/launch.dart';
import 'package:http/http.dart' as http;

class Network {
  final _host = 'api.spacexdata.com';
  final _contextRoot = '/v4';

  Future<Launch> request() async {
    final uri = Uri.https(_host, '$_contextRoot/launches/latest');
    final headers = _headers;
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return Launch.fromJson(jsonObject);
  }

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json; charset=utf-8',
        'Accept': 'application/json',
      };
}
