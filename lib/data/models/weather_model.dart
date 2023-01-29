import '../../domain/entities/entities.dart';

class WeatherEntitiesModel extends WeatherEntities {
  const WeatherEntitiesModel({
    required super.coord,
    required super.weather,
    required super.base,
    required super.main,
    required super.visibility,
    required super.wind,
    required super.clouds,
    required super.dt,
    required super.sys,
    required super.timezone,
    required super.id,
    required super.name,
    required super.cod,
  });

  factory WeatherEntitiesModel.fromJson(Map<String, dynamic> json) =>
      WeatherEntitiesModel(
        coord: CoordModel.fromJson(json['coord']),
        weather: List<WeatherModel>.from(
            json['weather'].map((x) => WeatherModel.fromJson(x))),
        base: json['base'],
        main: MainModel.fromJson(json['main']),
        visibility: json['visibility'],
        wind: WindModel.fromJson(json['wind']),
        clouds: CloudsModel.fromJson(json['clouds']),
        dt: json['dt'],
        sys: SysModel.fromJson(json['sys']),
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
      );
}

class CoordModel extends Coord {
  const CoordModel({
    required super.lon,
    required super.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
        lon: json['lon']?.toDouble(),
        lat: json['lat']?.toDouble(),
      );
}

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
}

class MainModel extends Main {
  const MainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        temp: json['temp']?.toDouble(),
        feelsLike: json['feels_like']?.toDouble(),
        tempMin: json['temp_min']?.toDouble(),
        tempMax: json['temp_max']?.toDouble(),
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'] ?? 0,
        grndLevel: json['grnd_level'] ?? 0,
      );
}

class WindModel extends Wind {
  const WindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json['speed']?.toDouble() ?? 0.0,
        deg: json['deg'],
        gust: json['gust']?.toDouble() ?? 0.0,
      );
}

class CloudsModel extends Clouds {
  const CloudsModel({
    required super.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json['all'],
      );
}

class SysModel extends Sys {
  const SysModel({
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
