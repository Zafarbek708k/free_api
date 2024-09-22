import "dart:developer";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

enum LangCodes { uz, ru, en, ja, ar }

const String _spLocalKey = "app_local";

class LocalController extends ChangeNotifier {
  String _appLocal;

  LocalController() : _appLocal = "uz" {
    SharedPreferences.getInstance().then<void>(
      (sp) {
        final appLocal = sp.getString(_spLocalKey);
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
      onError: (e) {
        log(e.toString());
      },
    );
  }

  Locale get appLocal {
    switch (_appLocal) {
      case "uz":
        return const Locale("uz", "UZ");
      case "ru":
        return const Locale("ru", "RU");
      case "en":
        return const Locale("en", "US");
      case "ja":
        return const Locale("ja", "JP");
      case "ar":
        return const Locale("ar", "SA");
      default:
        return const Locale("uz", "UZ");
    }
  }

  void changeLocal(LangCodes langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then<void>(
      (sp) {
        sp.setString(_spLocalKey, _appLocal);
      },
      onError: (e) {
        log(e.toString());
      },
    );
    notifyListeners();
  }
}
