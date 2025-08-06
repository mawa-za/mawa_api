import 'dart:convert';
import 'package:mawa_api/src/keys/network-resource-keys.dart';
import 'package:mawa_api/src/objects/notification.dart';
import 'package:mawa_api/src/services/network-request.dart';

class NotificationService{
  get(String user, String status) async {
    dynamic jsonObject;
    List<Notification> notificationObjectList = [];
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.notification}',
        queryParameters: {'user': user, 'status':status});

    if (response.statusCode == 200) {
      jsonObject = jsonDecode(response.body);
      notificationObjectList =
          (jsonObject as List).map((data) => Notification.fromJson(data)).toList();
    } else {}
    return notificationObjectList;
  }
}