class StorageBin {
  late dynamic binId;
  late dynamic aisle;
  late dynamic rack;
  late dynamic shelf;
  late dynamic product;
  late dynamic description;
  late dynamic binCode;
  late dynamic published;
  StorageBin(
      {this.binId,
        this.aisle,
        this.rack,
        this.shelf,
        this.product,
        this.description,
        this.published,
        this.binCode});

  factory StorageBin.fromJson(Map<String, dynamic> parsedJson) {
    return StorageBin(
      binId: parsedJson['binId'].toString(),
      aisle: parsedJson['aisle'].toString(),
      rack: parsedJson['rack'].toString(),
      shelf: parsedJson['shelf'].toString(),
      product: parsedJson['product'].toString(),
      description: parsedJson['description'].toString(),
      binCode: parsedJson['binCode'].toString(),
      published: parsedJson['published']
    );
  }
}