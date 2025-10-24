import 'package:mawa_api/src/keys/shared-preference-keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MawaAPI {
  static Future<void> setAPIHost(String environment) async {
    final prefs = await SharedPreferences.getInstance();

    String apiHost = 'localhost:8080';
    switch (environment) {
      case 'beta':
        apiHost = 'beta.api.app.mawa.co.za';
        break;
      case 'prod':
        apiHost = 'api.app.mawa.co.za';
        break;
      case 'dev':
        apiHost = 'dev.api.app.mawa.co.za';
        break;
      case 'alpha':
        apiHost = 'alpha.api.app.mawa.co.za';
        break;
    }

    await prefs.setString(SharedPrefKey.apiHost, apiHost);
  }

  static Future<void> setTenant(String tenant) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKey.tenantID, tenant);
  }

  static Future<String?> getTenant() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKey.tenantID);
  }

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKey.token, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKey.token);
  }

  static Future<void> setSalesArea(String salesArea) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKey.salesArea, salesArea);
  }

  static Future<String?> getSalesArea() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKey.salesArea);
  }
}
