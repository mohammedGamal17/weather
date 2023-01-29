

class APIConstants {
  static const String appId = 'YOUR ID';
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static String getWeatherByCity({
    required String city,
    required String language,
  }) =>
      '$baseUrl?q=$city&lang=$language&appid=$appId';

  static String getWeatherByCurrentLocation({
    required double lat,
    required double lon,
    required String language ,
  }) =>
      '$baseUrl?lat=$lat&lon=$lon&lang=$language&appid=$appId';
}
