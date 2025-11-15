class Leave {
  final String id;

  Leave({
    this.id = '',
  });

  factory Leave.fromJson(Map<String, dynamic> parsedJson) {
    return Leave(
      id: parsedJson['id'].toString(),
    );
  }
}