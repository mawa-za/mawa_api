import 'package:mawa_api/src/keys/shared-preference-keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MawaAPI{
  late String tenant;
  late final String environment;
  static Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  static setAPIHost(environment) {
    dynamic apiHost = 'dev.api.app.mawa.co.za';
    if (environment == 'qas') {
      apiHost = 'qas.api.app.mawa.co.za';
    } else if (environment == 'prod') {
      apiHost = 'api.app.mawa.co.za';
    } else if (environment == 'dev') {
      apiHost = 'dev.api.app.mawa.co.za';
    }
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.apiHost, apiHost));
    });
  }

  static setTenant({required tenant}){
    preferences.then((SharedPreferences prefs) {
      return (prefs.setString(SharedPrefKey.tenantID, tenant));
    });
  }

  static String? getTenant(){
    preferences.then((SharedPreferences prefs) {
      return (prefs.getString(SharedPrefKey.tenantID));
    });
  }
}
