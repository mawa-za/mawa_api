class Membership {
  late dynamic transactionId;
  late dynamic transactionType;
  late dynamic transactionSubtype;
  late dynamic transactionNumber;
  late dynamic identityType;
  late dynamic identityNumber;
  late dynamic mainPartner;
  late dynamic employeeResponsible;
  late dynamic product;
  late dynamic creationDate;
  late dynamic transactionStatus;

  Membership(
      {this.transactionId,
      this.transactionType,
      this.transactionSubtype,
      this.transactionNumber,
      this.identityType,
      this.identityNumber,
      this.mainPartner,
      this.employeeResponsible,
      this.product,
      this.creationDate,
      this.transactionStatus});

  factory Membership.fromJson(Map<String, dynamic> parsedJson) {
    return Membership(
      transactionId: parsedJson['transactionId'].toString(),
      transactionType: parsedJson['transactionType'].toString(),
      transactionSubtype: parsedJson['transactionSubtype'].toString(),
      transactionNumber: parsedJson['transactionNumber'].toString(),
      identityType: parsedJson['identityType'].toString(),
      identityNumber: parsedJson['identityNumber'].toString(),
      mainPartner: parsedJson['mainPartner'].toString(),
      employeeResponsible: parsedJson['employeeResponsible'].toString(),
      product: parsedJson['product'].toString(),
      creationDate: parsedJson['creationDate'].toString(),
      transactionStatus: parsedJson['transactionStatus'].toString(),
    );
  }
}
