import "dart:developer";
import "dart:ui";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "../../core/style/app_theme.dart";

const String _spThemeKey = "is_light_theme";

class ThemeController with ChangeNotifier {
  ThemeController()
      : _isLight =
      PlatformDispatcher.instance.platformBrightness != Brightness.dark {
    SharedPreferences.getInstance().then<void>((sp) {
      final theme = sp.getBool(_spThemeKey);
      log("theme get bool shp ==  $theme");
      if (theme != null && theme != isLight) {
        _isLight = theme;
        log("isLight == $theme");
        notifyListeners();
      }
    }).catchError((e) {
      log(e.toString());
    });
  }

  ThemeData get theme => isLight ? AppThemes.light() : AppThemes.dark();

  bool get isLight => _isLight;

  bool get isDark => !isLight;

  bool _isLight;

  void switchTheme() {
    log("1 - $_isLight");
    _isLight = !_isLight;
    log("2- $_isLight");

    SharedPreferences.getInstance().then<void>((sp) {
      log("save isLight = $_isLight");
      sp.setBool(_spThemeKey, _isLight);
      bool? a = sp.getBool(_spThemeKey);
      log("a = $a");

      // Notify listeners only after the value is saved
      notifyListeners();
    }).catchError((e) {
      log(e.toString());
    });
  }
}






// const String _spThemeKey = "is_light_theme";
//
//
// class ThemeController with ChangeNotifier {
//   ThemeController() : _isLight = PlatformDispatcher.instance.platformBrightness != Brightness.dark {
//     SharedPreferences.getInstance().then<void>(
//       (sp) {
//         final theme = sp.getBool(_spThemeKey);
//         log("theme get bool shp ==  $theme");
//         if (theme != null && theme != isLight) {
//           _isLight = theme;
//           log(" isLight == $theme");
//           notifyListeners();
//         }
//       },
//       onError: (e) {
//         log(e);
//       },
//     );
//   }
//
//   ThemeData get theme => isLight ? AppThemes.light() : AppThemes.dark();
//
//   bool get isLight => _isLight;
//
//   bool get isDark => !isLight;
//
//   bool _isLight;
//
//   void switchTheme() {
//     log("1 - $_isLight");
//     _isLight = !_isLight;
//     log("2- $_isLight");
//     SharedPreferences.getInstance().then<void>(
//       (sp) {
//         log("save isLight = $_isLight");
//         sp.setBool(_spThemeKey, _isLight);
//        bool? a =  sp.getBool(_spThemeKey);
//        log("a = $a");
//       },
//       onError: (e) {
//         log(e);
//       },
//     );
//     notifyListeners();
//   }
// }
