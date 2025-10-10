import 'dart:convert';
import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/storage-bin.dart';
import 'package:mawa_api/src/services/network-request.dart';

import '../objects/setting.dart';

class SettingService {
  post(dynamic body) async {
    dynamic jsonObject;
    Setting? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.setting);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object = Setting.fromJson(jsonObject);
    } else {}
    return object;
  }

  update(dynamic body) async {
    dynamic jsonObject;
    Setting? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.setting);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object = Setting.fromJson(jsonObject);
    } else {}
    return object;
  }

  get(String type, String attribute) async {
    dynamic jsonObject;
    Setting? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.setting,
        queryParameters: {"type": "$type", "attribute": "$attribute"});
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object = Setting.fromJson(jsonObject);
    } else {}
    return object;
  }

  getAll() async {
    dynamic jsonObject;
    List<Setting> list = [];
    dynamic response = await NetworkRequest()
        .securedMawaAPI(NetworkRequest.methodGet, resource: Resources.setting);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list =
          (jsonObject as List).map((data) => Setting.fromJson(data)).toList();
    } else {}
    return list;
  }
}
