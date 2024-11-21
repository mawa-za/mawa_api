class Individual {
  late dynamic partnerId;
  late dynamic partnerNo;
  late dynamic partnerType;
  late dynamic partnerRole;
  late dynamic identityType;
  late dynamic identityNumber;
  late dynamic name1;
  late dynamic name2;
  late dynamic name3;
  late dynamic birthDate;
  late dynamic gender;
  late dynamic title;
  late dynamic status;
  late dynamic maritalStatus;

  Individual(
      {this.partnerId,
        this.partnerNo,
        this.partnerType,
        this.partnerRole,
        this.identityType,
        this.identityNumber,
        this.name1,
        this.name2,
        this.name3,
        this.birthDate,
        this.gender,
        this.title,
        this.status,
        this.maritalStatus
       });

  factory Individual.fromJson(Map<String, dynamic> parsedJson) {
    return Individual(
      partnerId: parsedJson['partnerId'].toString(),
      partnerNo: parsedJson['partnerNo'].toString(),
      partnerType: parsedJson['partnerType'].toString(),
      partnerRole: parsedJson['partnerRole'].toString(),
      identityType: parsedJson['identityType'].toString(),
      identityNumber: parsedJson['identityNumber'].toString(),
      name1: parsedJson['name1'].toString(),
      name2: parsedJson['name2'].toString(),
      name3: parsedJson['name3'].toString(),
      birthDate: parsedJson['birthDate'].toString(),
      gender: parsedJson['gender'].toString(),
      title: parsedJson['title'].toString(),
      status: parsedJson['status'].toString(),
      maritalStatus: parsedJson['maritalStatus'].toString(),
    );
  }
}