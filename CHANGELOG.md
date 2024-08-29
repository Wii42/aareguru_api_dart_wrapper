## 0.0.1

- Initial version.

## 0.1.0

- First complete implementation

### 0.1.0+1

- Parsing is handled centrally via JsonParses, parsing is now more robust
- Added basic tests for api calls `city()`, `current()`, `today()` and `widget()`.

### 0.1.0+2

- fixed issue in parsing WeatherAtTime

## 0.2.0

- Added tests for parsing of all models
- Fixed errors discovered by tests
- Moved coordinates from custom Coordinate class to `package:latlong2` `LatLng` class

## 0.3.0 

- Added `Scale` class to replace `List<ScaleEntry>` to add functionality (e.g. selectFittingScaleEntry)
- Added tests for `Scale` class and `ScaleEntry` ( especially `ScaleEntry.compareTo`)

### 0.3.0+1
selectFittingScaleEntry switched parameter type from double to 

## 0.3.1

- Added documentation for some classes
- Wrote Readme
- Added example
- renamed 'CurrentWeather.currentTemperature' to 'CurrentWeather.temperature'
- renamed 'City.forecast' to 'City.hasAareTemperatureForecast'
- renamed 'City.aarePreciceTemperature' to 'City.aarePreciseTemperature'

## 0.3.2 (latest)
- *BREAKING*: renamed some fields to be more uniform across classes
- added documentation for all classes
- renamed some fields to be more uniform across classes
- moved to json_serializable for json parsing
