class StorageBin {
  late dynamic binId;
  late dynamic aisle;
  late dynamic rack;
  late dynamic stack;
  late dynamic shelf;
  late dynamic product;
  late dynamic description;
  late dynamic binCode;
  late dynamic published;
  late dynamic batchNumber;
  late dynamic expiryDate;
  StorageBin(
      {this.binId,
      this.aisle,
      this.rack,
      this.stack,
      this.shelf,
      this.product,
      this.description,
      this.published,
      this.binCode,
      this.batchNumber,
      this.expiryDate});

  factory StorageBin.fromJson(Map<String, dynamic> parsedJson) {
    return StorageBin(
        binId: parsedJson['binId'].toString(),
        aisle: parsedJson['aisle'].toString(),
        rack: parsedJson['rack'].toString(),
        stack: parsedJson['stack'].toString(),
        shelf: parsedJson['shelf'].toString(),
        product: parsedJson['product'].toString(),
        description: parsedJson['description'].toString(),
        binCode: parsedJson['binCode'].toString(),
        published: parsedJson['published'],
        batchNumber: parsedJson['batchNumber'].toString() ?? '',
        expiryDate: parsedJson['expiryDate'] ?? '') ;

  }
}
