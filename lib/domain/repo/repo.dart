import 'package:dartz/dartz.dart';

import '../../app/errors/failure.dart';
import '../../data/models/weather_model.dart';
import '../use_cases/weather_by_city_use_case.dart';
import '../use_cases/weather_by_current_location.dart';

abstract class Repositories {
  Future<Either<Failure, WeatherEntitiesModel>> getWeatherByCity(
    WeatherByCityInputs inputs,
  );

  Future<Either<Failure, WeatherEntitiesModel>> getWeatherByCurrentLocation(
    WeatherByCurrentLocationInputs inputs,
  );
}
