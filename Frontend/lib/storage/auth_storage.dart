import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_accessTokenKey, accessToken);
    await preferences.setString(_refreshTokenKey, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_refreshTokenKey);
  }

  Future<void> clearTokens() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_accessTokenKey, "");
    await preferences.setString(_refreshTokenKey, "");
  }

  Future<void> saveUserDetails(String name, String email, String phoneNumber) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('name', name);
    await preferences.setString('email', email);
    await preferences.setString('phone_number', phoneNumber);
  }

  Future<String?> getName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }

  Future<String?> getEmail() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('email');
  }

  Future<String?> getPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('phone_number');
  }
  
}
