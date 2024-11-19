import 'dart:convert';

import 'package:mawa_api/src/objects/membership.dart';
import 'package:mawa_api/src/services/network-request.dart';

import '../keys/network-resource-keys.dart';

class MembershipService {
  getAll() async {
    dynamic jsonObject;
    List<Membership> membershipObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.membershipV2);

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      membershipObjectList = (jsonObject as List)
          .map((data) => Membership.fromJson(data))
          .toList();
    } else {}
    return membershipObjectList;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Membership> membershipObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.membership}/$id');

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      membershipObjectList = (jsonObject as List)
          .map((data) => Membership.fromJson(data))
          .toList();
    } else {}
    return membershipObjectList;
  }
}
