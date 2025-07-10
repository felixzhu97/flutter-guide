import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('zh', 'CN');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    _saveLocale();
    notifyListeners();
  }

  void toggleLocale() {
    if (_locale.languageCode == 'zh') {
      setLocale(const Locale('en', 'US'));
    } else {
      setLocale(const Locale('zh', 'CN'));
    }
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(AppConstants.localeKey) ?? 'zh_CN';
    final parts = localeCode.split('_');
    _locale = Locale(parts[0], parts.length > 1 ? parts[1] : '');
    notifyListeners();
  }

  Future<void> _saveLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      AppConstants.localeKey,
      '${_locale.languageCode}_${_locale.countryCode}',
    );
  }
}
