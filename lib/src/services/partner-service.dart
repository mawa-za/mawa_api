import 'dart:convert';

import 'package:mawa_api/src/objects/member.dart';
import 'package:mawa_api/src/services/network-request.dart';

import '../keys/network-resource-keys.dart';
import '../objects/partner.dart';

class PartnerService {
  create(Partner partner) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.partner_v2,
        body: {
          'partnerType': partner.partnerType,
          'identityType': partner.identityType,
          'identityNumber': partner.identityNumber,
          'name1': partner.name1,
          'name2': partner.name2,
          'name3': partner.name3,
        });
    return response;
  }

  search({required String query,required String role}) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.partner_v2,
        queryParameters: {'query': query,'role':role});
    return response;
  }

  getById(String id) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.partner}/$id');
    return response;
  }

  addRole(String id, String role) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: '${Resources.partner_v2}/$id/role',
        body: [role]);
    return response;
  }
}
