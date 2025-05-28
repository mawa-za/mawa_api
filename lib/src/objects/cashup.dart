class Cashup {
  final String memberId;
  final String memberNo;
  final String identityType;
  final String identityNo;
  final String surname;
  final String firstName;
  final String secondName;

  Cashup({
    this.memberId = '',
    this.memberNo = '',
    this.identityType = '',
    this.identityNo = '',
    this.surname = '',
    this.firstName = '',
    this.secondName = '',
  });

  factory Cashup.fromJson(Map<String, dynamic> parsedJson) {
    return Cashup(
      memberId: parsedJson['partnerId'].toString(),
      memberNo: parsedJson['partnerNo'].toString(),
      identityType: parsedJson['identityType'].toString(),
      identityNo: parsedJson['identityNo'].toString(),
      surname: parsedJson['lastName'].toString(),
      firstName: parsedJson['firstName'].toString(),
      secondName: parsedJson['middleName'].toString(),
    );
  }
}