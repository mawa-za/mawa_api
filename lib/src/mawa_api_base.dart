import 'package:mawa_api/src/keys/shared-preference-keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MawaAPI {
  late final String environment;
  static Future<SharedPreferences> preferences =
      SharedPreferences.getInstance();

  static setAPIHost(environment) {
    dynamic apiHost = 'localhost:8080';
    if (environment == 'beta') {
      apiHost = 'beta.api.app.mawa.co.za';
    } else if (environment == 'prod') {
      apiHost = 'api.app.mawa.co.za';
    } else if (environment == 'dev') {
      apiHost = 'dev.api.app.mawa.co.za';
    }else if (environment == 'alpha') {
      apiHost = 'alpha.api.app.mawa.co.za';
    }
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.apiHost, apiHost));
    });
  }

  static setTenant(tenant) {
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.tenantID, tenant));
    });
  }

  static String? getTenant() {
    preferences.then((SharedPreferences prefs) {
      return (prefs.getString(SharedPrefKey.tenantID));
    });
  }

  static setToken({required token}) {
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.tenantID, token));
    });
  }

  static String? getToken() {
    preferences.then((SharedPreferences prefs) {
      return (prefs.getString(SharedPrefKey.token));
    });
  }

  static setSalesArea({required salesArea}) {
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.salesArea, salesArea));
    });
  }

  static String? getSalesArea() {
    preferences.then((SharedPreferences prefs) {
      return (prefs.getString(SharedPrefKey.salesArea));
    });
  }
}
