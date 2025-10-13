class Product {
  late dynamic code;
  late dynamic description;
  late dynamic type;
  late dynamic category;
  late dynamic uom;
  late dynamic price;
  late dynamic autoGenerateCode;
  Product(
      {this.code,
      this.description,
      this.type,
      this.category,
      this.uom,
      this.price,
      this.autoGenerateCode});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
        code: parsedJson['code'].toString(),
        description: parsedJson['description'].toString(),
        type: parsedJson['type'].toString(),
        category: parsedJson['category'].toString(),
        uom: parsedJson['baseUnitOfMeasure'].toString(),
        price: parsedJson['price'].toString(),
        autoGenerateCode: parsedJson['autoGenerateCode'].toString());
  }
}
