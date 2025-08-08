import 'dart:convert';
import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/services/network-request.dart';


class NotificationApiService {
  get(String user, String status) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.notification}',
        queryParameters: {'user': user, 'status': status});
    return response;
  }
}
