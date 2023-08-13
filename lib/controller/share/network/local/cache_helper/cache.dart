import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /*static Future<bool> setData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }*/

  //this function to save data in cache helper
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    return await sharedPreferences.setDouble(key, value);
  }

  //this function to get data from cache helper
  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  //this function to delete data from cache helper
  static dynamic removeData({
    required String key,
  }) {
    return sharedPreferences.remove(key);
  }
}
