import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';
import '../../../data/network/network_info.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/weather_by_city_use_case.dart';
import '../../../domain/use_cases/weather_by_current_location.dart';
import '../../resources/color/color_manager.dart';
import '../../resources/components/components.dart';
import '../../resources/string/string_manager.dart';
import '../../view/enable_location/enable_location.dart';

class WeatherProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;
  final WeatherByCityUseCase _weatherByCityUseCase;
  final WeatherByCurrentLocationUseCase _currentLocationUseCase;

  WeatherProvider(
    this._networkInfo,
    this._weatherByCityUseCase,
    this._currentLocationUseCase,
  );

  WeatherEntities? weather;
  List<String> test = [];
  List cities = [];

  void getWeatherByLocation(context) async {
    if (await _networkInfo.isConnected) {
      _determinePosition(context).then(
        (value) async {
          final response = await _currentLocationUseCase.call(
            WeatherByCurrentLocationInputs(
              latitude: value.latitude,
              longitude: value.longitude,
              lang: getIt<AppPreferences>().getLanguage(),
            ),
          );
          response.fold(
            (l) => alert(
              context,
              quickAlertType: QuickAlertType.error,
              text: l.message,
              textColor: ColorManager.error,
            ),
            (r) => {
              weather = r,
            },
          );
          notifyListeners();
        },
      );
    } else {
      noInternet(
        context,
        onConfirmBtnTap: () {
          Navigator.pop(context);
          return getWeatherByLocation(context);
        },
      );
      notifyListeners();
    }
  }

  Future<Position> _determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    _isServiceEnabled(context, serviceEnabled: serviceEnabled);
    permission = await Geolocator.checkPermission();
    _checkLocationPermission(context, permission: permission);

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future _isServiceEnabled(context, {required bool serviceEnabled}) async {
    if (!serviceEnabled) {
      alert(
        context,
        quickAlertType: QuickAlertType.warning,
        text: StringManager.locationServicesAreDisabled,
        textColor: ColorManager.primary,
      );

      return Future.error(StringManager.locationServicesAreDisabled);
    }
  }

  Future _checkLocationPermission(
    context, {
    required LocationPermission permission,
  }) async {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        alert(
          context,
          quickAlertType: QuickAlertType.error,
          text: StringManager.locationPermissionsAreDenied,
          textColor: ColorManager.error,
          onConfirmBtnTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EnableLocation(),
              ),
            );
          },
        );
        return Future.error(StringManager.locationPermissionsAreDenied);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      alert(
        context,
        quickAlertType: QuickAlertType.error,
        text: StringManager.locationPermissionsAreDeniedForEver,
        textColor: ColorManager.error,
        onConfirmBtnTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const EnableLocation(),
            ),
          );
        },
      );
      return Future.error(StringManager.locationPermissionsAreDeniedForEver);
    }
  }

  void getWeatherByCity(
    context, {
    required String city,
  }) async {
    if (await _networkInfo.isConnected) {
      final response = await _weatherByCityUseCase.call(
        WeatherByCityInputs(
          city: city,
          lang: getIt<AppPreferences>().getLanguage(),
        ),
      );
      response.fold(
        (l) => alert(
          context,
          quickAlertType: QuickAlertType.error,
          text: l.message,
          textColor: ColorManager.error,
        ),
        (r) {
          weather = r;
        },
      );
      notifyListeners();
    } else {
      noInternet(
        context,
        onConfirmBtnTap: () {
          Navigator.pop(context);
          return getWeatherByCity(context, city: city);
        },
      );
      notifyListeners();
    }
  }

  int _convertToCelsiusTemp({
    required double kelvinTemp,
  }) {
    double temp = kelvinTemp - 273.15;
    return temp.toInt();
  }

  String tempFormation({
    required double kelvinTemp,
  }) {
    int celsiusTemp = _convertToCelsiusTemp(kelvinTemp: kelvinTemp);
    return '$celsiusTemp \u00b0';
  }

  String convertTimeStamp({
    required int timeStamp,
  }) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

    String formattedTime = DateFormat('hh:mm a').format(date);

    return formattedTime;
  }

  bool isMorning({
    required int sunrise,
    required int sunset,
    required int dateTime,
  }) {
    int sunriseDate = sunrise * 1000;
    int sunsetDate = sunset * 1000;
    int dt = dateTime * 1000;

    return dt >= sunriseDate && dt < sunsetDate;
  }
}
