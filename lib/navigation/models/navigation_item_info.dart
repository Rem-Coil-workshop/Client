import 'package:flutter/material.dart';
import 'package:slot_service_app/base/base_main_screen.dart';

class NavigationItemInfo {
  final String title;
  final IconData icon;
  final BaseMainScreen widget;

  NavigationItemInfo({
    required this.title,
    required this.icon,
    required this.widget,
  });
}
