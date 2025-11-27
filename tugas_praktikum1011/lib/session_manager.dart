import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String keyUsername = 'username';
  static const String keyIsLoggedIn = 'is_logged_in';

  /// Simpan session login (dipakai saat login berhasil)
  static Future<void> setLoginSession(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, username);
    await prefs.setBool(keyIsLoggedIn, true);
  }

  /// Ambil username yang tersimpan
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername);
  }

  /// Cek apakah user sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

  /// Logout user (hapus semua data session)
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}