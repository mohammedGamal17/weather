import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../app/errors/failure.dart';
import '../entities/entities.dart';
import '../repo/repo.dart';
import 'base_use_case.dart';

class WeatherByCurrentLocationUseCase
    implements BaseUseCase<WeatherEntities, WeatherByCurrentLocationInputs> {
  final Repositories _repositories;

  WeatherByCurrentLocationUseCase(this._repositories);

  @override
  Future<Either<Failure, WeatherEntities>> call(
      WeatherByCurrentLocationInputs inputs) async {
    return await _repositories.getWeatherByCurrentLocation(inputs);
  }
}

class WeatherByCurrentLocationInputs extends Equatable {
  final double latitude;
  final double longitude;
  final String lang;

  const WeatherByCurrentLocationInputs({
    required this.latitude,
    required this.longitude,
    required this.lang,
  });

  @override
  List<Object> get props => [latitude, longitude,lang];
}
