import 'package:shared_preferences/shared_preferences.dart';

String lang = 'en';
const String isDarkModeKey = 'isDarkMode';
const String isOnBoardingShow = 'isOnBoardingShow';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //OnBoarding
  /// Set Value in On Boarding to be TRUE in shared pref
  Future<void> setIsOnBoarding() async {
    await _sharedPreferences.setBool(isOnBoardingShow, true);
  }

  /// Get Value of On Boarding
  Future<bool> getIsOnBoarding() async {
    return _sharedPreferences.getBool(isOnBoardingShow) ?? false;
  }

  // Theme
  /// Set Value of Theme
  void saveThemeData(bool isDarkMode) {
    _sharedPreferences.setBool(isDarkModeKey, isDarkMode);
  }

  /// Get Value of Theme
  bool isSavedDarkMode() {
    return _sharedPreferences.getBool(isDarkModeKey) ?? false;
  }


  // Language
  void setLanguage({
    required String language
}) {
    _sharedPreferences.setString(lang, language);
  }

  String getLanguage() {
    return _sharedPreferences.getString(lang) ?? 'en';
  }
}
