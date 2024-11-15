import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;
  String currentLanguage = "en";
  SharedPreferences? preferences;
  final String _themeKey = 'theme';
  final String _langKey = 'language';


  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;

    notifyListeners();
    saveTheme(newTheme);
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String backgroundImage() {
    return isDark()
        ? "assets/images/bg_dark.png"
        : "assets/images/background.png";
  }

  changeLanguage(String newlang) {
    if (currentLanguage == newlang) return;

    currentLanguage = newlang;

    notifyListeners();
    saveLanguage(newlang);

  }

  bool isEnglish() {
    return currentLanguage == "en";
  }
  String? getTheme() {
    return preferences!.getString(_themeKey);
  }

  Future<void> saveTheme(ThemeMode theme) async {
    String themeValue = (theme == ThemeMode.light ? "light" : "dark");
    await preferences!.setString(_themeKey, themeValue);
  }

  String? getLanguage (){
    return preferences!.getString(_langKey);
  }

  Future<void> saveLanguage(String lang) async{
    String langValue = (lang == "ar"?'ar':'en');
    await preferences!.setString(_langKey, lang);
  }

  Future<void> loadingSettingConfig() async {
    preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? lang = getLanguage();
    if (themeMode != null) {
      currentTheme = (themeMode == 'light' ? ThemeMode.light : ThemeMode.dark);
    }

    if(lang!=null){
      currentLanguage = (lang == "ar"? 'ar':'en');
    }
  }


}
