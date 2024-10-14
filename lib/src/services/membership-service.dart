

import 'package:mawa_api/src/services/network-request.dart';
import 'package:mawa_api/src/services/user-service.dart';
import 'package:mawa_api/src/utils/keys.dart';

class MembershipService{
  getAll() async {

    dynamic response = await NetworkRequest()
        .securedMawaAPI(NetworkRequest.methodGet, resource: Resources.membership);

    Map<String, String> mapUsers = {};

    if (response.statusCode == 200) {
      // listUsers =
      // await NetworkRequest.decodeJson(response, negativeResponse: []);
      // try{
      // for (int i = 0; i < listUsers.length; i++) {
      //   listUsers[i][JsonResponses.usersFirstName] != null &&
      //       listUsers[i][JsonResponses.usersFirstName] != null
      //       ? mapUsers['${listUsers[i][JsonResponses.id]}'] =
      //   '${listUsers[i][JsonResponses.usersLastName] ?? 'Surname not Supplied'}, ${listUsers[i][JsonResponses.usersFirstName] ?? 'Name not Supplied'}' //'${listUsers[i][JsonKeys.usersLastName]}, ${listUsers[i][JsonKeys.usersFirstName]}'
      //       : mapUsers['${listUsers[i][JsonResponses.id]}'] =
      //   'No Name Provided';
      // }
    } else {
      mapUsers.clear();
    }
    return UserService.user = mapUsers;
  }
}