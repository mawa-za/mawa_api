
import 'package:flutter/material.dart';

class Constants {

  static const String notFound = 'Not Found';
  static const String notSupplied = 'Not Supplied';

  static  const TextStyle subtitleStyle =
  TextStyle(fontSize: 10.0, color: Colors.grey);

  static final List<dynamic> list = [];

  static textInputDecorations(String textLabel, icon, {String? hint, String? helperTxt}) {
    return InputDecoration(
        helperText: helperTxt ?? '',
        icon: Icon(icon),
        labelText: textLabel,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ));
  }
}