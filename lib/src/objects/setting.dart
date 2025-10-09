class Setting {
  late dynamic type;
  late dynamic attribute;
  late dynamic value;
  Setting(
      {this.type,
        this.attribute,
        this.value});

  factory Setting.fromJson(Map<String, dynamic> parsedJson) {
    return Setting(
      type: parsedJson['type'].toString(),
      attribute: parsedJson['attribute'].toString(),
      value: parsedJson['value'].toString(),
    );
  }
}