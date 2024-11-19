class FieldOption {
  late dynamic field;
  late dynamic code;
  late dynamic description;


  FieldOption(
      {this.field,
        this.code,
        this.description});

  factory FieldOption.fromJson(Map<String, dynamic> parsedJson) {
    return FieldOption(
      field: parsedJson['field'].toString(),
      code: parsedJson['code'].toString(),
      description: parsedJson['description'].toString(),
    );
  }
}
