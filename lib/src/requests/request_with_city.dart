import 'api_request.dart';

abstract class RequestWithCity<T extends Object> extends ApiRequest<T> {
  final String city;

  RequestWithCity(super.host, super.apiPath,
      {required this.city, super.appName, super.appVersion});

  @override
  Future<String> formRequest([List<String>? values]) =>
      baseRequest(parameters: {'city': city}, values: values ?? []);
}
