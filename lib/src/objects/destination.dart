import 'package:flutter/material.dart';

class MawaDestination {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final String route;
  const MawaDestination({
    required this.icon,
    required this.label,
    required this.route,
    this.selectedIcon,
  });
}