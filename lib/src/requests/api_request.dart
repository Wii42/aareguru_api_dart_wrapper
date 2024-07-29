import 'dart:convert';

import 'package:http/http.dart' as http;

/// Abstract class for the API request, created to cut down on code duplication
/// between the different API endpoints, especially in the [request] and
/// [requestWithValues] methods.
/// It is not designed to be called used directly by the user of the library and
/// should be wrapped by for example [AareGuruApi].
abstract class ApiRequest<T extends Object> {
  final String host;
  final String apiPath;
  final String? appName;
  final String? appVersion;

  String get endpoint;

  ApiRequest(this.host, this.apiPath, {this.appName, this.appVersion});

  /// blueprint for a request, should called in the implementation of the
  /// [formRequest] method
  Future<String> baseRequest(
      {Map<String, dynamic>? parameters,
      List<String> values = const []}) async {
    parameters ??= {};
    if (appName != null) {
      parameters['app'] = appName;
    }
    if (appVersion != null) {
      parameters['version'] = appVersion;
    }
    if (values.isNotEmpty) {
      parameters['values'] = values.join(',');
    }
    String path = [apiPath, endpoint].join('/');
    Uri url = Uri.https(host, path, parameters);
    return await sendRequest(url);
  }

  /// sends the request to the specified [url]
  Future<String> sendRequest(Uri url) async {
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch data from Aare.guru API, '
          'status code: ${response.statusCode} ${response.reasonPhrase}');
    }
    print(response.request?.url);
    return response.body;
  }

  /// is called by the [request] and [requestWithValues]method to form the
  /// request. Should be overridden by subclasses to add [parameters]
  Future<String> formRequest([List<String>? values]) =>
      baseRequest(values: values ?? []);

  /// Subclasses should implement this method to parse the response from the API.
  /// Is used in the [request] method.
  T parseResponse(dynamic json);

  ///Request without values Specified, therefore the whole response is returned in parsed form.
  Future<T> request() async {
    String response = await formRequest();
    dynamic json = jsonDecode(response);
    return parseResponse(json);
  }

  /// A request with [values] specified, only the values of the given keys in
  /// [values] are in the response
  Future<List<String>> requestWithValues(List<String> values) async {
    if (values.isEmpty) {
      throw ArgumentError('Values must not be empty');
    }
    String response = await formRequest(values);
    return _parseValues(response);
  }

  /// parses the response from the API into a list of strings, only to be used
  /// if [values] is specified in the request
  List<String> _parseValues(String data) {
    return data.split('\n');
  }

  /// Same parsed return as [request] but from the given [url].
  /// Can be used if the exact url for the request is provided externally.
  /// Schuld not be used if [values] are specified.
  Future<T> urlRequest(Uri url) async {
    String response = await sendRequest(url);
    dynamic json = jsonDecode(response);
    return parseResponse(json);
  }
}
