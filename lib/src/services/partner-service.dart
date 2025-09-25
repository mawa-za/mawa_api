import 'dart:convert';

import 'package:mawa_api/src/objects/member.dart';
import 'package:mawa_api/src/services/network-request.dart';

import '../keys/network-resource-keys.dart';
import '../objects/partner.dart';

class PartnerService {
  create(Partner partner) async {
    dynamic jsonObject;
    Partner? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.partner_v2,
        body: {
          'partnerRole': partner.partnerRole,
          'partnerType': partner.partnerType,
          'identityType': partner.identityType,
          'identityNumber': partner.identityNumber,
          'name1': partner.name1,
          'name2': partner.name2,
          'name3': partner.name3,
          'contactNumber': partner.contactNumber,
          'email': partner.email,
        });

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object =  Partner.fromJson(jsonObject);
    } else {}
    return object;
  }

  search({required String query,required String role}) async {
    dynamic jsonObject;
    List<Partner> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.partner_v2,
        queryParameters: {'query': query,'role':role});
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => Partner.fromJson(data))
          .toList();
    } else {}
    return list;
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
