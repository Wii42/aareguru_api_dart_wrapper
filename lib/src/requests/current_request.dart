import 'package:aareguru_api/src/response_objects/current/current.dart';

import 'request_with_city.dart';

class CurrentRequest extends RequestWithCity<Current> {
  @override
  final String endpoint = 'current';

  CurrentRequest(super.host, super.apiPath,
      {required super.city, super.appName, super.appVersion});

  @override
  Current parseResponse(dynamic json) => Current.fromJson(json);
}
