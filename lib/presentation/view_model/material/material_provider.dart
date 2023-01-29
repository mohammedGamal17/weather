import 'package:flutter/material.dart';

import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';

const String isDarkModeKey = 'isDarkModeKey';

class MaterialProvider extends ChangeNotifier {
  Locale? _currentLocal;

  Locale? get currentLocal => _currentLocal;

  void changeLocal({
    required String local,
  }) {
    _currentLocal = Locale(local);
    getIt<AppPreferences>().setLanguage(language: local);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    return getIt<AppPreferences>().isSavedDarkMode()
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void changeTheme() {
    getIt<AppPreferences>().saveThemeData(
      !getIt<AppPreferences>().isSavedDarkMode(),
    );
    notifyListeners();
  }
}
