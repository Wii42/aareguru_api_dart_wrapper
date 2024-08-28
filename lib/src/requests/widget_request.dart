import 'package:aareguru_api/src/response_objects/widget_data.dart';

import 'api_request.dart';

class WidgetRequest extends ApiRequest<WidgetData> {
  @override
  final String endpoint = 'widget';

  WidgetRequest(super.host, super.apiPath, {super.appName, super.appVersion});

  @override
  WidgetData parseResponse(dynamic json) => WidgetData.fromJson(json);
}
