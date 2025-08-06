class Notification {
  late dynamic title;
  late dynamic message;

  Notification({this.title, this.message});

  factory Notification.fromJson(Map<String, dynamic> parsedJson) {
    return Notification(
      title: parsedJson['title'].toString(),
      message: parsedJson['message'].toString(),
    );
  }
}
