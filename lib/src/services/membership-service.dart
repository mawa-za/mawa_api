

import 'package:mawa_api/src/services/network-request.dart';
import 'package:mawa_api/src/services/user-service.dart';
import 'package:mawa_api/src/utils/keys.dart';

class MembershipService{
  getAll() async {

    dynamic response = await NetworkRequest()
        .securedMawaAPI(NetworkRequest.methodGet, resource: Resources.membership);

    Map<String, dynamic> membershipMap = {};

    if (response.statusCode == 200) {
 
    } else {

    }
    return response;
  }
}