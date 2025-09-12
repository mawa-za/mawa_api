import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/storage-bin.dart';
import 'package:mawa_api/src/services/network-request.dart';

class StorageBinService{
  post(dynamic body) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.storageBin,
        body: body);
    return response;
  }

  get(String id) async {
    dynamic jsonObject;
    List<StorageBin> receiptObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.storageBin}/$id');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      receiptObjectList = (jsonObject as List)
          .map((data) => StorageBin.fromJson(data))
          .toList();
    } else {}
    return receiptObjectList;
  }

  getAll() async {
    dynamic jsonObject;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.storageBin);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      return (jsonObject as List)
          .map((data) => StorageBin.fromJson(data))
          .toList();
    } else {
      return [];
    }
  }
}