import 'package:flutter/material.dart';

class NavigationItemInfo {
  final String title;
  final IconData icon;
  final int privacyLevel;
  final String route;
  final int index;

  NavigationItemInfo({
    required this.title,
    required this.icon,
    required this.route,
    required this.privacyLevel,
    required this.index,
  });
}
