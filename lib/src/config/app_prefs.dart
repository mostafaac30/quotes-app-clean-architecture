import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? appLanguage = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (appLanguage != null && appLanguage.isNotEmpty) {
      return appLanguage;
    } else {
      return Language.ENGLISH.getValue();
    }
  }
}
