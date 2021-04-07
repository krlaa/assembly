import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final dashboardItemsList = [
  DashboardItem(
      selectedIcon: Icon(Icons.home), label: "Home", icon: Icon(Icons.home)),
  DashboardItem(
      selectedIcon: Icon(Icons.home),
      label: "Tasks",
      icon: Icon(Icons.note_add)),
  DashboardItem(
      selectedIcon: Icon(Icons.home),
      label: "Notfications",
      icon: Icon(Icons.add_alert)),
  DashboardItem(
      selectedIcon: Icon(Icons.home),
      label: "Settings",
      icon: Icon(Icons.settings))
];

class DashboardItem {
  Icon icon;
  Icon selectedIcon;
  String label;
  bool isSelected = false;
  DashboardItem({
    @required this.icon,
    @required this.selectedIcon,
    @required this.label,
  });
}
