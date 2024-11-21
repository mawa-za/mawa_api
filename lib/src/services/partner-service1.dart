// import 'package:mawa_api/src/services/network-request.dart';
// import 'package:mawa_api/src/utils/keys.dart';
//
// class Partner {
//   static late String partnerId;
//   static late String personIdNumber;
//   late String clientStatus;
//   late bool status;
//   static Map person = {};
//   static Map group = {};
//   static List people = [];
//   static List personRoles = [];
//   static dynamic personIdentities;
//   static dynamic personContacts;
//   List personDetail = [];
//
//   Partner(String id) {
//     partnerId = id;
//   }
//
//   static String personNameFromJson(json) {
//     if (json != null) {
//       return '${json[JsonResponses.personLastName] ?? ''}, ${json[JsonResponses.personFirstName] ?? ''} ${json[JsonResponses.personMiddleName] ?? ''}';
//     } else {
//       return '';
//     }
//   }
//
//   static Future personSearch(
//       {String? idNumber,
//       String? idType,
//       String? lastName,
//       String? middleName,
//       String? firsName}) async {
//     Partner.people.clear();
//     dynamic peopleResponse = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodGet,
//         resource: Resources.persons,
//         queryParameters: {
//           'idnumber': idNumber,
//           'idtype': idType,
//           'firstName': firsName,
//           'middleName': middleName,
//           'lastName': lastName,
//           'filter': 'x'
//         });
//
//     // peopleResponse.runtimeType == people.runtimeType ? people = peopleResponse: people = [];
//     people = await NetworkRequest.decodeJson(peopleResponse);
//     return people;
//   }
//
//   validateSAID(id) async {
//     Map<String, dynamic> response = await NetworkRequest.decodeJson(
//         await NetworkRequest().securedMawaAPI(await NetworkRequest.methodGet,
//             resource: 'validateSAID?idnumber=$id'));
//     response != null ? status = response['valid'] : null;
//     return status;
//   }
//
//   getPerson() async {
//     Partner.person.clear();
//     dynamic respond = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodGet,
//         resource: '${Resources.persons}/$partnerId');
//     try {
//       person = await NetworkRequest.decodeJson(respond, negativeResponse: {});
//     } catch (e) {
//       person = {};
//     }
//     return person;
//   }
//
//   static getOrganizations() async {
//     return await NetworkRequest.decodeJson(
//         await NetworkRequest().securedMawaAPI(NetworkRequest.methodGet,
//             resource: Resources.organization),
//         negativeResponse: []);
//   }
//
//   Future<dynamic> adaNewClient(clientDetails) async {
//     return await NetworkRequest.decodeJson(await NetworkRequest()
//         .securedMawaAPI(NetworkRequest.methodPost,
//             resource: Resources.persons, body: clientDetails));
//   }
//
//   Future assignPersonRole({required String personRole}) async {
//     await NetworkRequest.decodeJson(await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodPost,
//         resource: '${Resources.partner}/$partnerId/roles',
//         queryParameters: {'role': personRole}));
//   }
//
//   addPersonDetail(
//       {required String personID,
//       required String path,
//       required String field,
//       required String detail}) async {
//     await NetworkRequest.decodeJson(await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodPost,
//         resource: '${Resources.persons}/$personID/$path',
//         body: {field: detail}));
//   }
//
//   getPersonDetail({
//     required String option,
//   }) async {
//     dynamic response = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodGet,
//         resource: '${Resources.persons}/${Partner.partnerId}/$option');
//     response.statusCode == 200
//         ? personDetail = await NetworkRequest.decodeJson(response)
//         : personDetail = [];
//     return personDetail;
//   }
//
//   //Add Identity
//   addIdentity(
//       {required String? path,
//       required dynamic idType,
//       required String? idNumber}) async {
//     dynamic response = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodPost,
//         resource: '${Resources.persons}/$partnerId/$path',
//         body: {
//           JsonPayloads.idType: idType,
//           JsonPayloads.personIdNumber: idNumber,
//         });
//   }
//
//   //add Contacts
//   addContact(
//       {required String? path,
//       required String? contactType,
//       required dynamic detail}) async {
//     dynamic response = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodPost,
//         resource: '${Resources.persons}/$partnerId/$path',
//         body: {
//           JsonPayloads.type: contactType,
//           JsonPayloads.cellNumber: detail,
//         });
//   }
//
//   //Add addresses
//   addAdress(
//       {required String? path,
//       required String? addressType,
//       required String? houseno,
//       required String? streetName,
//       required dynamic suburb,
//       required dynamic city,
//       required String? postalCode}) async {
//     dynamic response = await NetworkRequest().securedMawaAPI(
//         NetworkRequest.methodPost,
//         resource: '${Resources.persons}/$partnerId/$path',
//         body: {
//           JsonPayloads.type: addressType,
//           JsonPayloads.addressline1: houseno,
//           JsonPayloads.addressline2: streetName,
//           JsonPayloads.addressline3: suburb,
//           JsonPayloads.addressline4: city,
//           JsonPayloads.postalCode: postalCode,
//         });
//   }
// }
