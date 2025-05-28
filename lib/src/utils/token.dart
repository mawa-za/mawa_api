
import 'package:mawa_api/src/services/network-request.dart';
import 'package:mawa_api/src/utils/global.dart';
import 'package:mawa_api/src/utils/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Token {

  static String refreshToken = '';

  getNewToken(userID) async {

    final SharedPreferences prefs = await preferences;

    String token;

    token = await prefs.getString(SharedPrefs.refreshToken) ?? '';

    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.refreshAuthenticate,
      body: {
          QueryParameters.userID: userID,
      },
    );

    if(response.statusCode == 200){
      // NetworkRequests.token = await NetworkRequests.decodeJson(response);
      token = await NetworkRequest.decodeJson(response);

      preferences.then((SharedPreferences prefs) {
        return (prefs.setString(SharedPrefs.token, token));
      });
      return true;
    }
    else{
      return false;
    }
  }
}