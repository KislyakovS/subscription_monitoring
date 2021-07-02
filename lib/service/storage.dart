import 'package:shared_preferences/shared_preferences.dart';

enum SettingsKey { notification, notificationTime, currency }

class Storage {
  final _storage = SharedPreferences.getInstance();

  Future<void> setSettings<T>(SettingsKey key, T value) async {
    final storage = await _storage;
    final keyStr = key.toString();

    if (value is String) {
      await storage.setString(keyStr, value);
    } else if (value is bool) {
      await storage.setBool(keyStr, value);
    } else if (value is int) {
      await storage.setInt(keyStr, value);
    }
  }

  Future<bool?> getSettings(SettingsKey key) async {
    final storage = await _storage;

    return storage.getBool(key.toString());
  }
}
