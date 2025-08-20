class Case {
  final String transactionType;
  final String transactionId;
  final String transactionNumber;
  final String identityType;
  final String identityNumber;
  final String mainPartner;
  final String transactionStatus;
  final String creationDate;
  final String transactionSubtype;
  final String employeeResponsible;
  final String product;
  Case({
    this.transactionType = '',
    this.transactionId = '',
    this.transactionNumber = '',
    this.identityType = '',
    this.identityNumber = '',
    this.mainPartner = '',
    this.transactionStatus = '',
    this.creationDate = '',
    this.transactionSubtype = '',
    this.employeeResponsible = '',
    this.product = '',
  });

  factory Case.fromJson(Map<String, dynamic> parsedJson) {
    return Case(
      transactionId: parsedJson['transactionId'].toString(),
      transactionNumber: parsedJson['transactionNumber'].toString(),
      transactionType: parsedJson['transactionType'].toString(),
      transactionSubtype: parsedJson['transactionSubtype'].toString(),
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