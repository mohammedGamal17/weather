import 'package:dio/dio.dart';

class APIConstants {
  static const String appId = '99f40c2e4455df0a3805434da9794ac3';
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
