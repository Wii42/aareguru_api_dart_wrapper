import 'package:aareguru_api/aareguru_api.dart';

void main() async {
  // Create an instance of the AareGuruApi class.
  // The appName and appVersion parameters are optional,
  // but should be set to identify your application.
  AareGuruApi api = AareGuruApi(
      appName: 'aareguru_api_dart_wrapper_example', appVersion: '0.3.1');

  // Get a list of all cities.
  List<City> cities = await api.cities();
  print('');
  // Print the names of all cities.
  print('Cities: ${cities.map((e) => e.name).join(', ')}');
  print('');
  // Print the first city.
  print('First city: ${cities.first}');
  print('\n');

  // See details for the city of Bern
  Current currentBern = await api.current(Cities.bern.name); // or 'bern'
  print('');

  // Print the current temperature of the Aare in Bern.
  print(
      'Current temperature of the Aare in Bern: ${currentBern.aare?.temperature}°C');

  // Print the current water flow of the Aare in Bern.
  print(
      'Current water flow of the Aare in Bern: ${currentBern.aare?.flow}m³/s');
  print('');

  // Print the current air temperature in Bern.
  print(
      'Current air temperature in Bern: ${currentBern.weather?.current?.temperature}°C');

  //Print the weather forecast for tomorrow in Bern.
  print(
      'Weather forecast for tomorrow in Bern: ${currentBern.weather?.forecast?.first.symbolText}');
  print('');

  // Print the sun hours today in Bern.
  print('Sun hours today in Bern: ${currentBern.sun?.today?.sunTotal}h');
  print('');

  //Current contains also data to the past, like the water flow and temperature
  // of the Aare, accessible via Current.aarePast,
  // or the weather, accessible via Current.weatherPast.

  //Other api endpoints are available, like the today() endpoint, which provides
  // a summary of the current day, or the widget() endpoint, which provides a
  // summary of the current day in a format suitable for a widget.

  // Every endpoint has a corresponding request method in the AareGuruApi class.

  // every request method has also a corresponding 'WithValues' method, allows
  // to specify the values that should be returned by the API.
  //For example, to get simply the current temperature and flow of the Aare in Bern:
  List<String> currentBernTemperature = await api.currentValues(Cities.bern.name, ['aare.temperature', 'aare.flow']);
  print('Current temperature of the Aare in Bern: ${currentBernTemperature[0]}°C');
  print('Current water flow of the Aare in Bern: ${currentBernTemperature[1]}m³/s');
}
