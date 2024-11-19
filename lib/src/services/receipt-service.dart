import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/receipt.dart';
import 'package:mawa_api/src/services/network-request.dart';

class ReceiptService{
  post(dynamic body) async {
    dynamic jsonObject;
    Receipt? receiptObject;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.receipt);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      receiptObject =  Receipt.fromJson(jsonObject);
    } else {}
    return receiptObject;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Receipt> receiptObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.receipt}/$id');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      receiptObjectList = (jsonObject as List)
          .map((data) => Receipt.fromJson(data))
          .toList();
    } else {}
    return receiptObjectList;
  }

  getAll() async {
    dynamic jsonObject;
    List<Receipt> receiptObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.receipt);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      receiptObjectList = (jsonObject as List)
          .map((data) => Receipt.fromJson(data))
          .toList();
    } else {}
    return receiptObjectList;
  }
}