import 'package:dartz/dartz.dart';

import '../../app/errors/failure.dart';
import '../../domain/repo/repo.dart';
import '../../domain/use_cases/weather_by_city_use_case.dart';
import '../../domain/use_cases/weather_by_current_location.dart';
import '../data_source/remote_data_source/remote_data_source.dart';
import '../models/weather_model.dart';

class RepositoriesImplementation implements Repositories {
  final BaseRemoteDataSource _baseRemoteDataSource;

  RepositoriesImplementation(this._baseRemoteDataSource);

  @override
  Future<Either<Failure, WeatherEntitiesModel>> getWeatherByCity(
      WeatherByCityInputs inputs) async {
    final response = await _baseRemoteDataSource.getWeatherByCity(inputs);
    try {
      return Right(response);
    } on RemoteErrorHandlerException catch (e) {
      return Left(
        RemoteErrorImplement(e.remoteError.code, e.remoteError.message),
      );
    }
  }

  @override
  Future<Either<Failure, WeatherEntitiesModel>> getWeatherByCurrentLocation(
      WeatherByCurrentLocationInputs inputs) async {
    final response = await _baseRemoteDataSource.getWeatherByLocation(inputs);
    try {
      return Right(response);
    } on RemoteErrorHandlerException catch (e) {
      return Left(
        RemoteErrorImplement(e.remoteError.code, e.remoteError.message),
      );
    }
  }

}
