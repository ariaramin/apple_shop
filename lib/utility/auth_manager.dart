import 'package:apple_shop/locator/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPref = locator.get();

  static void saveToken(String token) {
    _sharedPref.setString("access_token", token);
    authChangeNotifire.value = token;
  }

  static String getToken() {
    return _sharedPref.getString("access_token") ?? "";
  }

  static void logout() {
    _sharedPref.remove("access_token");
    authChangeNotifire.value = null;
  }

  static bool isLogedIn() {
    return getToken().isNotEmpty;
  }
}
