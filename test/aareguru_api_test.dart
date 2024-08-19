import 'package:aareguru_api/aareguru_api.dart';
import 'package:test/test.dart';

/// Test the AareGuruApi, check if the API is working and all endpoints are reachable
void main() {
  AareGuruApi api = AareGuruApi(appName: 'Wi42_test', appVersion: '0.1');
  test('City', () async {
    List<City> cities = await api.cities();
    expect(cities.length, greaterThan(0));
  });
  test('Today', () async {
    Today today = await api.today(Cities.bern.name);
    expect(today, isNotNull);
  });
  test('Current', () async {
    Current current = await api.current(Cities.bern.name);
    expect(current, isNotNull);
  });
  test('Widgets', () async {
    WidgetData widgetData = await api.widget();
    expect(widgetData, isNotNull);
  });
}
