class Receipt {
  late dynamic membershipId;
  late dynamic membershipPeriod;
  late dynamic employeeResponsible;
  late dynamic tenderType;
  late dynamic amount;
  late dynamic terminalId;
  late dynamic externalReceiptNo;
  Receipt(
      {this.membershipId,
      this.membershipPeriod,
      this.employeeResponsible,
      this.tenderType,
      this.amount,
      this.terminalId,
      this.externalReceiptNo});

  factory Receipt.fromJson(Map<String, dynamic> parsedJson) {
    return Receipt(
      membershipId: parsedJson['membershipId'].toString(),
      membershipPeriod: parsedJson['membershipPeriod'].toString(),
      employeeResponsible: parsedJson['employeeResponsible'].toString(),
      tenderType: parsedJson['tenderType'].toString(),
      amount: parsedJson['amount'].toString(),
      terminalId: parsedJson['terminalId'].toString(),
      externalReceiptNo: parsedJson['externalReceiptNo'].toString(),
    );
  }
}
