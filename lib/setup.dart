
import "package:flutter/widgets.dart";
import "package:shared_preferences/shared_preferences.dart";


late final SharedPreferences db;


Future<void>setup()async{
  WidgetsFlutterBinding.ensureInitialized();

}
