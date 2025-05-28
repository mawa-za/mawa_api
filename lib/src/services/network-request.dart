import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mawa_api/mawa_api.dart';
import 'package:mawa_api/src/services/user-service.dart';
import 'package:mawa_api/src/utils/global.dart';
import 'package:mawa_api/src/utils/keys.dart';
import 'package:mawa_api/src/utils/token.dart';
import 'package:mawa_api/src/utils/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkRequest {
  NetworkRequest({this.responseType}) {
    _getToken();
  }

  Future<void> _getToken() async {
    _key = preferences.then((SharedPreferences prefs) {
      return (prefs.getString(SharedPrefs.token) ?? '');
    });
  }

  String? responseType /* = responseJson*/;

  static const String methodGet = 'get';
  static const String methodPost = 'POST';
  static const String methodPut = 'put';
  static const String methodDelete = 'delete';
  late String apiURL;
  static String port = '8181';
  late String apiHost;
  static String path = '/mawa-api/resources/';
  late http.Response feedback;
  late final Future<String> _key;
  static String token = '';
  static String tenantID = '';
  static String otp = '';
  static int statusCode = 100;
  static const String responseJson = 'json';
  static const String responseBlob = 'blob';
  static const String responseFormData = 'blob';
  dynamic responseCaught;

  static const int requestTime = 60;

  static decodeJson(data, {dynamic negativeResponse}) async {
    dynamic response = await data;
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        return jsonDecode(response.body) ?? negativeResponse;
      } catch (e) {
        return negativeResponse;
      }
    } else {
      return negativeResponse;
    }
  }

  Map<String, String> headers({required String tokenKey, bool secured = true}) {
    Map<String, String> headers = {
      "X-TenantID": tenantID,
    };
    secured ? headers["Authorization"] = "Bearer $token" : null;

    responseType ??= responseJson;
    if (responseType == responseJson) {
      headers['Content-type'] = 'application/json; charset=UTF-8';
    }
    if (responseType == responseBlob) {
      headers['Content-type'] = 'application/json';
    }
    if (responseType == responseFormData) {
      headers['Content-type'] = 'multipart/form-data';
    }

    return headers;
  }

  String getTenant() {
    if (kIsWeb) {
      // running on the web!
      var base = Uri.base.origin;
      return base.split('//').last;
    } else {
      return "";
      // NOT running on the web! You can check for additional platforms here.
    }
  }

  Future<dynamic> securedMawaAPI(
    String method, {
    required String resource,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool secured = true,
  }) async {
    // token == null ? token = await _key: null;
    final SharedPreferences prefs = await preferences;

    apiHost = await prefs.getString(SharedPrefs.apiHost) ?? '';
    token = await prefs.getString(SharedPrefs.token) ?? '';

    String tenant = prefs.getString(SharedPrefs.tenantID) ?? '';
    if (tenant.isNotEmpty) {
      tenantID = tenant;
    } else {
      if (kIsWeb) {
        var base = Uri.base.origin;
        tenantID = base.split('//').last;
      } else {
        tenantID = tenant;
      }
    }
    dynamic url;
    if (apiHost == 'localhost:8080') {
      url = Uri.http(apiHost, resource, queryParameters);
    } else {
      url = Uri.https(apiHost, resource, queryParameters);
    }


    dynamic header = headers(
      tokenKey: token,
      secured: secured,
    );

    if (kDebugMode) {
      print(method);
      print(url);
      print(header);
      print(body);
    }
    try {
      switch (method) {
        case methodGet:
          feedback = await http.get(
            url,
            headers: header,
          );
          break;
        case methodDelete:
          feedback = await http.delete(
            url,
            headers: header,
          );
          break;
        case methodPost:
          feedback = await http.post(url,
              headers: headers(tokenKey: token), body: jsonEncode(body));
          break;
        case methodPut:
          feedback = await http.put(url,
              // Uri.https(endpointURL, path + resource),
              headers: headers(tokenKey: token),
              body: jsonEncode(body));
          break;
      }
      return feedback;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return responseCaught;
    }
  }

  Future unsecuredMawaAPI(
    String method, {
    required String resource,
    Map<String, String>? payload,
    Map<String, dynamic>? queryParameters,
    BuildContext? context,
  }) async {
    final SharedPreferences prefs = await preferences;
    apiHost = await prefs.getString(SharedPrefs.apiHost) ?? '';

    // if (kIsWeb) {
    //   var base = Uri.base.origin;
    //   tenantID = base.split('//').last;
    // } else {
      tenantID = await prefs.getString(SharedPrefs.tenantID) ?? '';
      // tenantID = MawaAPI.getTenant() ?? '';
    // }
    apiURL = 'https://$apiHost/';
    dynamic url;

    if (apiHost == 'localhost:8080') {
      url = Uri.http(apiHost, resource, queryParameters);
    } else {
      url = Uri.https(apiHost, resource, queryParameters);
    }

    try {
      switch (method) {
        case methodGet:
          feedback = await http.get(
            url,
            // headers: headers,
            headers: this.headers(tokenKey: token, secured: false),
          );
          break;
        case methodDelete:
          feedback = await http.delete(
            url,
            // headers: headers,
            headers: this.headers(tokenKey: token, secured: false),
          );
          break;
        case methodPost:
          feedback = await http.post(url,
              headers: this.headers(tokenKey: token, secured: false),
              // headers: headers,
              body: jsonEncode(payload));
          break;
        case methodPut:
          feedback = await http.put(url,
              headers: this.headers(tokenKey: token, secured: false),
              // headers: headers,
              body: jsonEncode(payload));
          break;
      }
      statusCode = feedback.statusCode;

      switch (NetworkRequest.statusCode) {
        case 200:
          {
            dynamic data;
            Tools.isTouchLocked = false;
            data = jsonDecode(feedback.body);
            if (resource == Resources.otp) {
              otp = await data;
            }
            if (resource == Resources.authenticate ||
                resource == Resources.authenticateApp) {
              token = await data[JsonResponses.token];
              Token.refreshToken = await data[JsonResponses.refreshToken] ?? '';
              preferences.then((SharedPreferences prefs) {
                return (prefs.setString(SharedPrefs.token, token));
              });
              preferences.then((SharedPreferences prefs) {
                return (prefs.setString(
                    SharedPrefs.refreshToken, Token.refreshToken));
              });
              // preferences.then((SharedPreferences prefs) {
              //   return (prefs.setString(SharedPrefs.username, UserService.username));
              // });
            }
          }
          break;
        default:
          {
            Tools.isTouchLocked = false;
          }
          break;
      }
      Tools.isTouchLocked = false;
      return feedback;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Tools.isTouchLocked = false;
      responseCaught = http.Response('Request Timed Out', 491);
      return responseCaught;
    }
  }
}
