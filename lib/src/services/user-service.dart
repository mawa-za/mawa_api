import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mawa_api/src/services/network-request.dart';
import 'package:mawa_api/src/utils/keys.dart';

class UserService {

  static String? partnerId;
  static String? groupId;
  static String userLoginRole = '';
  static Map<String, String> userRoles = {};
  static Map loggedInUser = {};
  static Map user = {};
  static List listUsers = [];
  static List assignees = [];

  static late List list = [];
  static late String gv_username;
  static late String password;
  static late String email;
  static late dynamic pass;
  late String resource;

  authenticate({required String username, required String password}) async {
    //username = username;
    dynamic response = await NetworkRequest().unsecuredMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.authenticate,
        payload: {"username": username, "password": password});
    return response;
  }

  authenticateApp({required String application,required String username, required String password}) async {
    //username = username;
    dynamic response = await NetworkRequest().unsecuredMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.authenticateApp,
        payload: {"username": username, "password": password, "application": application});
    return response;
  }

  ping() async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: Resources.ping);
    return response;
  }

  get(String id) async {
    user = await NetworkRequest.decodeJson(
      await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodGet,
        resource: '${Resources.user}/$id',
      ),
      negativeResponse: {},
    );
    return user;
  }

  getUserDetails(String username, {bool getPerson = false}) async {
    loggedInUser.clear();
    try {
      dynamic response = await NetworkRequest().securedMawaAPI(
          NetworkRequest.methodGet,
          resource: '${Resources.user}/$username');
      if (response.statusCode == 200) {
        user.clear();
        dynamic data =
            await NetworkRequest.decodeJson(response, negativeResponse: {});
        user.addAll(data);
        partnerId = user[JsonResponses.username];
      }
    } catch (e) {
      user.clear();
    }
    return user;
  }

  getAllUsers() async {
    UserService.user.clear();
    dynamic response = await NetworkRequest()
        .securedMawaAPI(NetworkRequest.methodGet, resource: Resources.user);

    Map<String, String> mapUsers = {};

    if (response.statusCode == 200) {
      listUsers =
          await NetworkRequest.decodeJson(response, negativeResponse: []);
      // try{
      for (int i = 0; i < listUsers.length; i++) {
        listUsers[i][JsonResponses.usersFirstName] != null &&
                listUsers[i][JsonResponses.usersFirstName] != null
            ? mapUsers['${listUsers[i][JsonResponses.id]}'] =
                '${listUsers[i][JsonResponses.usersLastName] ?? 'Surname not Supplied'}, ${listUsers[i][JsonResponses.usersFirstName] ?? 'Name not Supplied'}' //'${listUsers[i][JsonKeys.usersLastName]}, ${listUsers[i][JsonKeys.usersFirstName]}'
            : mapUsers['${listUsers[i][JsonResponses.id]}'] =
                'No Name Provided';
      }
    } else {
      mapUsers.clear();
    }
    return UserService.user = mapUsers;
  }

  // forgotPassword({required String emailAddress}) async {
  //   Map<String, String> headers = {"Content-type": "application/json"};
  //   Map json = {"email": emailAddress};
  //   http.Response response = await http.post(
  //       Uri.http(NetworkRequest().apiURL,
  //           NetworkRequest.path + Resources.forgotPassword),
  //       headers: headers,
  //       body: jsonEncode(json));
  //   NetworkRequest.statusCode = response.statusCode;
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     NetworkRequest.token = jsonDecode(response.body);
  //   } else if (response.statusCode == 417) {
  //     return jsonDecode(response.body);
  //   }
  // }
  forgotPassword({required String emailAddress}) async {
    //username = username;
    dynamic response = await NetworkRequest().unsecuredMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.forgotPassword,
        queryParameters: {"email": emailAddress});
    return response;
  }

  changePassword({required String password}) async {
    return await NetworkRequest().securedMawaAPI(NetworkRequest.methodPut,
        resource: Resources.changePassword, body: {"password": password});
  }

  resetPassword({required String username}) async {
    return await NetworkRequest.decodeJson(await NetworkRequest()
        .securedMawaAPI(NetworkRequest.methodPost,
            resource: '${Resources.user}/$username/${Resources.reset}'));
  }

  // getUserRoles() async {
  //   userRoles = {};
  //   // List
  //   list = await NetworkRequest.decodeJson(await NetworkRequest()
  //       .securedMawaAPI(NetworkRequest.methodGet,
  //           resource: '${Resources.user}/$username/role'));
  //   return list;
  // }

  addUser({
    required String id,
    required String email,
    required String cellphone,
    required String partnerNum,
    required String role,
    required String userType,
  }) async {
    dynamic response = await NetworkRequest().securedMawaAPI(
        NetworkRequest.methodPost,
        resource: Resources.user,
        body: {
          JsonPayloads.id: id,
          JsonPayloads.userType: userType,
          JsonPayloads.email: email,
          JsonPayloads.cellphone: cellphone,
          JsonPayloads.partnerID: partnerNum,
          JsonPayloads.role: role,
        });
    pass = await NetworkRequest.decodeJson(response, negativeResponse: '');

    if (response.statusCode == 200 || response.statusCode == 201) {
      dynamic p = pass['password'];
      dynamic i = pass['id'];
    }
    return response;
  }

  getUsersByOrganisation() async {
    assignees = await NetworkRequest.decodeJson(
        await NetworkRequest().securedMawaAPI(NetworkRequest.methodGet,
            resource: Resources.user + '/' + Resources.OrganizationUsers,
            queryParameters: {
              QueryParameters.organizationId:
              UserService.loggedInUser[JsonResponses.usersGroupId]
            }),
        negativeResponse: []);

    return assignees;
  }
}
