import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/app/errors/failure.dart';

import '../entities/entities.dart';
import '../repo/repo.dart';
import 'base_use_case.dart';

class WeatherByCityUseCase
    extends BaseUseCase<WeatherEntities, WeatherByCityInputs> {
  final Repositories _repositories;

  WeatherByCityUseCase(this._repositories);

  @override
  Future<Either<Failure, WeatherEntities>> call(
      WeatherByCityInputs inputs) async {
    return await _repositories.getWeatherByCity(inputs);
  }
}

class WeatherByCityInputs extends Equatable {
  final String city;
  final String lang;

  const WeatherByCityInputs({required this.city,required this.lang});

  @override
  List<Object> get props => [city,lang];
}
