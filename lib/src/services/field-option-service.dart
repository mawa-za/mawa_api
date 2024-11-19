import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/field-option.dart';
import 'package:mawa_api/src/services/network-request.dart';

class FieldOptionService {
  getAll() async {
    dynamic jsonObject;
    List<FieldOption> fieldObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.field);

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      fieldObjectList = (jsonObject as List)
          .map((data) => FieldOption.fromJson(data))
          .toList();
    } else {}
    return fieldObjectList;
  }

  getOptions(field) async {
    dynamic jsonObject;
    List<FieldOption> fieldObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.field +'/'+field}/${Resources.option}');

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      fieldObjectList = (jsonObject as List)
          .map((data) => FieldOption.fromJson(data))
          .toList();
    } else {}
    return fieldObjectList;
  }
}
