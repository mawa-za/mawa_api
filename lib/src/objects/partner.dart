class Partner {
  final String partnerRole;
  final String partnerType;
  final String partnerId;
  final String partnerNo;
  final String identityType;
  final String identityNumber;
  final String name1;
  final String name2;
  final String name3;
  final String email;
  final String contactNumber;

  Partner({
    this.partnerRole = '',
    this.partnerType = '',
    this.partnerId = '',
    this.partnerNo = '',
    this.identityType = '',
    this.identityNumber = '',
    this.name1 = '',
    this.name2 = '',
    this.name3 = '',
    this.email = '',
    this.contactNumber = '',
  });

  factory Partner.fromJson(Map<String, dynamic> parsedJson) {
    return Partner(
      partnerRole: parsedJson['partnerRole'].toString(),
      partnerType: parsedJson['partnerType'].toString(),
      partnerId: parsedJson['partnerId'].toString(),
      partnerNo: parsedJson['partnerNo'].toString(),
      identityType: parsedJson['identityType'].toString(),
      identityNumber: parsedJson['identityNumber'].toString(),
      name1: parsedJson['name1'].toString(),
      name2: parsedJson['name2'].toString(),
      name3: parsedJson['name3'].toString(),
      contactNumber: parsedJson['contactNumber'].toString(),
      email: parsedJson['email'].toString(),
    );
  }

  String get fullName {
    return [name1, name2, name3].where((n) => n.isNotEmpty).join(' ');
  }

  /// Display name based on partner type
  String get displayName {
    if (partnerType.toUpperCase() == 'ORGANISATION') {
      // For organisations, just use name1
      return name1;
    } else {
      // For individuals, use full name
      return fullName;
    }
  }
}