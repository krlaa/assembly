import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

final lightTheme = ThemeData(
    textTheme: Typography.blackMountainView,
    iconTheme: IconThemeData(color: Colors.blueGrey[700]),
    cardColor: Colors.blueGrey[100].lighten(5),
    scaffoldBackgroundColor: Colors.blueGrey[50],
    primaryColor: Colors.deepPurpleAccent[200],
    primarySwatch: Colors.deepPurple);
final darkTheme = ThemeData(
  
    textTheme: Typography.whiteMountainView,
    iconTheme: IconThemeData(color: Colors.deepPurple[50]),
    cardColor: Colors.grey[900].darken(5),
    scaffoldBackgroundColor: Colors.grey[900],
    primaryColor: Colors.deepPurpleAccent[100],
    primarySwatch: Colors.deepPurple);
