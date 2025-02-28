import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/global/methods_helpers_functions/encryption.dart';

class LocalStorageHelper {
  static Future<void> setString(
      {required String key, required String value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String encrypted = EncryptionUtils.encryptAES(value);
    await sharedPreferences.setString(key, encrypted);
  }

  static Future<String?> getString({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? encrypted = sharedPreferences.getString(key);
    if (encrypted == null) return null;
    return EncryptionUtils.decryptAES(encrypted);
  }

  static Future<void> setBool(
      {required String key, required bool value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }

  static Future<void> remove({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> saveUserMainData({
    required String userId,
    required String token,
    required String refreshToken,
  }) async {
    await setString(key: 'user_id', value: userId);
    await setString(key: 'token', value: token);
    await setString(key: 'refresh_token', value: refreshToken);
    await setBool(key: 'is_authenticated', value: true);
  }

  static Future<void> saveUserTokens({
    required String token,
    required String refreshToken,
  }) async {
    await setString(key: 'token', value: token);
    await setString(key: 'refresh_token', value: refreshToken);
  }

  static Future<void> clearUserMainData() async {
    await remove(key: 'user_id');
    await remove(key: 'token');
    await remove(key: 'refresh_token');
    await remove(key: 'is_authenticated');
  }
}
