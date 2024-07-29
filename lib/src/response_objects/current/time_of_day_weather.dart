class TimeOfDayWeather {
  String? weatherSymbol; // in API "sy"
  String? weatherText; // in API "syt"
  String? weatherSymbol2; // in API "symt";
  double? temperature; // in API "tt"
  int? rainfall; // in API "rr"
  double? rainfallRisk; // in API "rrisk"

  TimeOfDayWeather({
    this.weatherSymbol,
    this.weatherText,
    this.weatherSymbol2,
    this.temperature,
    this.rainfall,
    this.rainfallRisk,
  });

  factory TimeOfDayWeather.fromJson(Map<String, dynamic> json) {
    return TimeOfDayWeather(
      weatherSymbol: json['sy'].toString(),
      weatherText: json['syt'].toString(),
      weatherSymbol2: json['symt'].toString(),
      temperature: double.tryParse(json['tt'].toString()),
      rainfall: int.tryParse(json['rr'].toString()),
      rainfallRisk: double.tryParse(json['rrisk'].toString()),
    );
  }

  @override
  String toString() {
    return 'TimeOfDayWeather(weatherSymbol: $weatherSymbol, weatherText: $weatherText, weatherSymbol2: $weatherSymbol2, temperature: $temperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
