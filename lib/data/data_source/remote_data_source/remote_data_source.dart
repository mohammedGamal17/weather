import 'package:dio/dio.dart';

import '../../../app/errors/failure.dart';
import '../../../domain/use_cases/weather_by_city_use_case.dart';
import '../../../domain/use_cases/weather_by_current_location.dart';
import '../../models/weather_model.dart';
import 'api_const/api_constants.dart';
import 'remote_error/remote_error.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherEntitiesModel> getWeatherByCity(WeatherByCityInputs inputs);

  Future<WeatherEntitiesModel> getWeatherByLocation(
      WeatherByCurrentLocationInputs inputs);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<WeatherEntitiesModel> getWeatherByCity(
      WeatherByCityInputs inputs) async {
    final response = await Dio().get(
      APIConstants.getWeatherByCity(city: inputs.city,language: inputs.lang),
    );

    if (response.statusCode == 200) {
      return WeatherEntitiesModel.fromJson(response.data);
    } else {
      throw RemoteErrorHandlerException(RemoteError.fromJson(response.data));
    }
  }

  @override
  Future<WeatherEntitiesModel> getWeatherByLocation(
      WeatherByCurrentLocationInputs inputs) async {
    final response = await Dio().get(
      APIConstants.getWeatherByCurrentLocation(
        lat: inputs.latitude,
        lon: inputs.longitude,
        language: inputs.lang,
      ),
    );

    if (response.statusCode == 200) {
      return WeatherEntitiesModel.fromJson(response.data);
    } else {
      throw RemoteErrorHandlerException(RemoteError.fromJson(response.data));
    }
  }
}
