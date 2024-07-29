import 'package:aareguru_api/src/response_objects/today.dart';

import 'request_with_city.dart';

class TodayRequest extends RequestWithCity<Today> {
  @override
  final String endpoint = 'today';

  TodayRequest(super.host, super.apiPath,
      {required super.city, super.appName, super.appVersion});

  @override
  Today parseResponse(dynamic json) => Today.fromJson(json);
}
