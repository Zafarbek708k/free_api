import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

@immutable
class StorageService {
  final SharedPreferences db;
  const StorageService({required this.db});
  static Future<SharedPreferences> get init async => SharedPreferences.getInstance();

  String? read(String key) => db.getString(key);

  Future<bool> remove(String key) => db.remove(key);

  Future<bool> store(String key, String data) => db.setString(key, data);

  /// store data
}
