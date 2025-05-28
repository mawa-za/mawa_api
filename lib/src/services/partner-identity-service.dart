import 'dart:convert';

import 'package:mawa_api/src/services/network-request.dart';

import '../keys/network-resource-keys.dart';
import '../objects/partner.dart';

class PartnerIdentityService {
  add(String id, dynamic body) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: '${Resources.partner_v2}/$id/identity',
        body: {
          'type': body.identityType,
          'number': body.identityNo,
        });
    return response;
  }

  search(String query) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.partner_v2,
        queryParameters: {'query': query});
    return response;
  }

  getById(String id) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.partner}/$id');
    return response;
  }
}