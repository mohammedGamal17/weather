import 'package:equatable/equatable.dart';

class WeatherEntities extends Equatable {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const WeatherEntities({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  @override
  List<Object> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}

class Coord extends Equatable {
  final double lon;
  final double lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object> get props => [lon, lat];
}

class Weather extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object> get props => [id, main, description, icon];
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  @override
  List<Object> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];
}

class Wind extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object> get props => [speed, deg, gust];
}

class Clouds extends Equatable {
  final int all;

  const Clouds({
    required this.all,
  });

  @override
  List<Object> get props => [all];
}

class Sys extends Equatable {
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object> get props => [country, sunrise, sunset];
}
