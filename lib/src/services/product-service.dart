import 'dart:convert';

import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/product.dart';
import 'package:mawa_api/src/objects/storage-bin.dart';
import 'package:mawa_api/src/services/network-request.dart';

class ProductService {
  post(dynamic body) async {
    dynamic jsonObject;
    Product? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        body: body,
        resource: Resources.product);
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object = Product.fromJson(jsonObject);
    } else {}
    return object;
  }

  get(String id) async {
    dynamic jsonObject;
    List<Product> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.product}/$id');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list =
          (jsonObject as List).map((data) => Product.fromJson(data)).toList();
    } else {}
    return list;
  }

  getByCode(String code) async {
    dynamic jsonObject;
    Product? object;
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.product}/code/$code');
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      object = Product.fromJson(jsonObject);
    } else {}
    return object;
  }

  getAll(List<String> typeList, String query) async {
    dynamic jsonObject;
    List<Product> list = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.product,
        queryParameters: {'type': typeList[0], 'query':query});
    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      list =
          (jsonObject as List).map((data) => Product.fromJson(data)).toList();
    } else {}
    return list;
  }
}
