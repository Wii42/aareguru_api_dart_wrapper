import 'dart:convert';

import 'package:aareguru_api/src/response_objects/widget.dart';

import 'response_objects/current/current.dart';
import 'response_objects/today.dart';
import 'package:http/http.dart' as http;

import 'response_objects/city.dart';

/// Wrapper for Aare.guru API v2018 (current)
class AareGuruApi {
  static const String host = 'aareguru.existenz.ch';
  static const String apiPath = '/v2018';

  /// Name of the app which uses the API
  String? appName;

  /// Version of the app which uses the API
  String? appVersion;

  AareGuruApi({this.appName, this.appVersion});

  Future<String> _baseRequest(String endpoint,
      {Map<String, dynamic>? parameters,
      List<String> values = const []}) async {
    parameters ??= {};
    String path = [apiPath, endpoint].join('/');
    if (appName != null) {
      parameters['app'] = appName;
    }
    if (appVersion != null) {
      parameters['version'] = appVersion;
    }
    if (values.isNotEmpty) {
      parameters['values'] = values.join(',');
    }
    http.Response response = await http.get(Uri.https(host, path, parameters));
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to fetch data from Aare.guru API, status code: ${response.statusCode} ${response.reasonPhrase}');
    }
    print(response.request?.url);
    return response.body;
  }

  Future<String> _cities([List<String>? values]) async {
    return _baseRequest('cities', values: values ?? []);
  }

  Future<List<City>> cities() async {
    String response = await _cities();
    List<dynamic> cities = jsonDecode(response);

    return cities.map((city) => City.fromJson(city)).toList();
  }

  Future<List<String>> citiesValues(List<String> values) async {
    if (values.isEmpty) {
      throw ArgumentError('Values must not be empty');
    }
    String response = await _cities(values);
    return _parseValues(response);
  }

  Future<String> _today(String city, [List<String>? values]) async {
    return _baseRequest('today',
        parameters: {'city': city}, values: values ?? []);
  }

  Future<Today> today(String city) async {
    String response = await _today(city);
    Today today = Today.fromJson(jsonDecode(response));
    return today;
  }

  Future<List<String>> todayValues(String city, List<String> values) async {
    if (values.isEmpty) {
      throw ArgumentError('Values must not be empty');
    }
    String response = await _today(city, values);
    return _parseValues(response);
  }

  Future<String> _current(String city, [List<String>? values]) async {
    return _baseRequest('current',
        parameters: {'city': city}, values: values ?? []);
  }

  Future<Current> current(String city) async {
    String response = await _current(city);
    Current current = Current.fromJson(jsonDecode(response));
    return current;
  }

  Future<List<String>> currentValues(String city, List<String> values) async {
    if (values.isEmpty) {
      throw ArgumentError('Values must not be empty');
    }
    String response = await _current(city, values);
    return _parseValues(response);
  }

  Future<String> _widget([List<String>? values]) async {
    return _baseRequest('widget', values: values ?? []);
  }

  Future<WidgetData> widget() async {
    String response = await _widget();
    return WidgetData.fromJson(jsonDecode(response));
  }

  Future<List<String>> widgetValues(List<String> values) async {
    if (values.isEmpty) {
      throw ArgumentError('Values must not be empty');
    }
    String response = await _widget(values);
    return _parseValues(response);
  }

  List<String> _parseValues(String data) {
    return data.split('\n');
  }
}
