import 'dart:convert';

import 'package:mawa_api/src/objects/member.dart';
import 'package:mawa_api/src/services/network-request.dart';

import '../keys/network-resource-keys.dart';

class CashupService {
  post(Member member) async {
    dynamic jsonObject;
    List<Member> memberList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.partner_v2,
        body: {
          'query': member.identityType,
          'query': member.identityNo,
          'query': member.surname,
          'query': member.firstName,
          'query': member.secondName,
        });

    if (response.statusCode == 200) {

    } else {}
    return memberList;
  }

  getAll(String query) async {
    dynamic jsonObject;
    List<Member> memberList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.partner_v2,
        queryParameters: {'query': query});

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      memberList =
          (jsonObject as List).map((data) => Member.fromJson(data)).toList();
    } else {}
    return memberList;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Member> membershipObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.partner}/$id');

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      membershipObjectList =
          (jsonObject as List).map((data) => Member.fromJson(data)).toList();
    } else {}
    return membershipObjectList;
  }
}
