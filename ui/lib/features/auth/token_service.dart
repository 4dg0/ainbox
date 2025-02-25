import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';

class TokenService {
  static const String _jwtKey = 'ainbox_jwt_token';
  static final _secureStorage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    if (_isWeb) {
      html.window.localStorage[_jwtKey] = token;
    } else {
      await _secureStorage.write(key: _jwtKey, value: token);
    }
  }

  static Future<String?> getToken() async {
    if (_isWeb) {
      return html.window.localStorage[_jwtKey];
    } else {
      return await _secureStorage.read(key: _jwtKey);
    }
  }

  static Future<void> deleteToken() async {
    if (_isWeb) {
      html.window.localStorage.remove(_jwtKey);
    } else {
      await _secureStorage.delete(key: _jwtKey);
    }
  }

  static bool get _isWeb => kIsWeb;
}
