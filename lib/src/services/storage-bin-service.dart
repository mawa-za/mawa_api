import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/storage-bin.dart';
import 'package:mawa_api/src/services/network-request.dart';

class StorageBinService{
  post(dynamic body) async {
    dynamic jsonObject;
    StorageBin? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.storageBin);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object =  StorageBin.fromJson(jsonObject);
    } else {}
    return object;
  }

  get(String id) async {
    dynamic jsonObject;
    List<StorageBin> binObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.storageBin}/$id');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      binObjectList = (jsonObject as List)
          .map((data) => StorageBin.fromJson(data))
          .toList();
    } else {}
    return binObjectList;
  }

  delete(String id) async {
    dynamic jsonObject;
    List<StorageBin> receiptObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodDelete,
        resource: '${Resources.storageBin}/$id');
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
    List<StorageBin> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.storageBin);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list = (jsonObject as List)
          .map((data) => StorageBin.fromJson(data))
          .toList();
    } else {}
    return list;
  }
}