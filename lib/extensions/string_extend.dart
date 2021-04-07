import 'package:flutter/material.dart';

extension HexColor on String {
  Color hexToColor() {
    return Color(int.parse('0xFF${this.substring(1)}'));
  }
}
