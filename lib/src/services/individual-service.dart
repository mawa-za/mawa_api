import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/individual.dart';
import 'package:mawa_api/src/services/network-request.dart';

class IndividualService {
  getAll() async {
    dynamic jsonObject;
    List<Individual> objectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.partnerV2,
        queryParameters: {"role":"CUSTOMER"});

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      objectList = (jsonObject as List)
          .map((data) => Individual.fromJson(data))
          .toList();
    } else {}
    return objectList;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Individual> objectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.partnerV2}/$id');

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      objectList = (jsonObject as List)
          .map((data) => Individual.fromJson(data))
          .toList();
    } else {}
    return objectList;
  }
}