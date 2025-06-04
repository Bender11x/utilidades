import 'package:flutter/widgets.dart';

class MenuModels {
  final String title;
  final IconData icon;
  final String route;
  final Widget page;

  MenuModels({
    required this.title,
    required this.icon,
    required this.route,
    required this.page});
}