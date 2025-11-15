import 'dart:convert';

import '../../mawa_api.dart';
import '../keys/network-resource-keys.dart';
import 'network-request.dart';

class LeaveService{
  post(dynamic body) async {
    dynamic jsonObject;
    Leave? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.storageBin);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object =  Leave.fromJson(jsonObject);
    } else {}
    return object;
  }

  me() async {
    dynamic jsonObject;
    List<Leave> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.leave}/me');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => Leave.fromJson(data))
          .toList();
    } else {}
    return list;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Leave> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.leave}/$id');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => Leave.fromJson(data))
          .toList();
    } else {}
    return list;
  }

  delete(String id) async {
    dynamic jsonObject;
    List<Leave> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodDelete,
        resource: '${Resources.leave}/$id');
    // if (response.statusCode == 200) {
    //   jsonObject = jsonDecode(response.body);
    //   receiptObjectList = (jsonObject as List)
    //       .map((data) => StorageBin.fromJson(data))
    //       .toList();
    // } else {}
    // return receiptObjectList;
  }

  getAll() async {
    dynamic jsonObject;
    List<Leave> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.leave);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => Leave.fromJson(data))
          .toList();
    } else {}
    return list;
  }

  search(dynamic query) async {
    dynamic jsonObject;
    List<Leave> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.leave);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => Leave.fromJson(data))
          .toList();
    } else {}
    return list;
  }
}