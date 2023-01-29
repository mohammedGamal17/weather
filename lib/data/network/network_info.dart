import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplement implements NetworkInfo {

  final InternetConnectionCheckerPlus _internetConnectionChecker;

  NetworkInfoImplement(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
  var isDeviceConnected = false;
}
