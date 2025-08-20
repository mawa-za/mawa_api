import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/case.dart';
import 'package:mawa_api/src/services/network-request.dart';

class CaseService{
  getAll(String query) async {
    dynamic jsonObject;
    List<Case> caseList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.caseV2,
        queryParameters: {'query': query});

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      caseList =
          (jsonObject as List).map((data) => Case.fromJson(data)).toList();
    } else {}
    return caseList;
  }
}