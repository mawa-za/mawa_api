class Partner {
  final String partnerType;
  final String partnerId;
  final String partnerNo;
  final String identityType;
  final String identityNumber;
  final String name1;
  final String name2;
  final String name3;

  Partner({
    this.partnerType = '',
    this.partnerId = '',
    this.partnerNo = '',
    this.identityType = '',
    this.identityNumber = '',
    this.name1 = '',
    this.name2 = '',
    this.name3 = '',
  });

  factory Partner.fromJson(Map<String, dynamic> parsedJson) {
    return Partner(
      partnerType: parsedJson['partnerType'].toString(),
      partnerId: parsedJson['partnerId'].toString(),
      partnerNo: parsedJson['partnerNo'].toString(),
      identityType: parsedJson['identityType'].toString(),
      identityNumber: parsedJson['identityNumber'].toString(),
      name1: parsedJson['name1'].toString(),
      name2: parsedJson['name2'].toString(),
      name3: parsedJson['name3'].toString(),
    );
  }
}