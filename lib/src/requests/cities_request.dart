import 'package:aareguru_api/src/response_objects/city.dart';

import 'api_request.dart';

class CitiesRequest extends ApiRequest<List<City>> {
  @override
  final String endpoint = 'cities';

  CitiesRequest(super.host, super.apiPath, {super.appName, super.appVersion});

  @override
  List<City> parseResponse(dynamic json) => City.fromJsonList(json);
}