// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ops... No Internet`
  String get noInternetError {
    return Intl.message(
      'Ops... No Internet',
      name: 'noInternetError',
      desc: '',
      args: [],
    );
  }

  /// `high`
  String get high {
    return Intl.message(
      'high',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `low`
  String get low {
    return Intl.message(
      'low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Air Quality`
  String get airQuality {
    return Intl.message(
      'Air Quality',
      name: 'airQuality',
      desc: '',
      args: [],
    );
  }

  /// `Wind Speed`
  String get windSpeed {
    return Intl.message(
      'Wind Speed',
      name: 'windSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Wind Gust`
  String get windGust {
    return Intl.message(
      'Wind Gust',
      name: 'windGust',
      desc: '',
      args: [],
    );
  }

  /// `Wind Degrees`
  String get windDeg {
    return Intl.message(
      'Wind Degrees',
      name: 'windDeg',
      desc: '',
      args: [],
    );
  }

  /// `meter/sec`
  String get meterPerSec {
    return Intl.message(
      'meter/sec',
      name: 'meterPerSec',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Feels Like`
  String get feelsLike {
    return Intl.message(
      'Feels Like',
      name: 'feelsLike',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get pressure {
    return Intl.message(
      'Pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `hPa`
  String get hPa {
    return Intl.message(
      'hPa',
      name: 'hPa',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `%`
  String get percentage {
    return Intl.message(
      '%',
      name: 'percentage',
      desc: '',
      args: [],
    );
  }

  /// `Sea Level`
  String get seaLevel {
    return Intl.message(
      'Sea Level',
      name: 'seaLevel',
      desc: '',
      args: [],
    );
  }

  /// `Ground Level`
  String get groundLevel {
    return Intl.message(
      'Ground Level',
      name: 'groundLevel',
      desc: '',
      args: [],
    );
  }

  /// `Clouds`
  String get clouds {
    return Intl.message(
      'Clouds',
      name: 'clouds',
      desc: '',
      args: [],
    );
  }

  /// `Cloudiness`
  String get cloudiness {
    return Intl.message(
      'Cloudiness',
      name: 'cloudiness',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message(
      'Cairo',
      name: 'cairo',
      desc: '',
      args: [],
    );
  }

  /// `Location Services Are Disabled.`
  String get locationServicesAreDisabled {
    return Intl.message(
      'Location Services Are Disabled.',
      name: 'locationServicesAreDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied.`
  String get locationPermissionsAreDenied {
    return Intl.message(
      'Location permissions are permanently denied.',
      name: 'locationPermissionsAreDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are permanently denied, we cannot request permissions.`
  String get locationPermissionsAreDeniedForEver {
    return Intl.message(
      'Location permissions are permanently denied, we cannot request permissions.',
      name: 'locationPermissionsAreDeniedForEver',
      desc: '',
      args: [],
    );
  }

  /// `Location not enable`
  String get locationNotEnable {
    return Intl.message(
      'Location not enable',
      name: 'locationNotEnable',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message(
      'Enable',
      name: 'enable',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
