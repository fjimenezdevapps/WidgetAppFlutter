import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(
            selectedColor >= 0, 'Selected color must be more greater then 0 '),
        assert(selectedColor < colorsList.length,
            'Selected color must be less or equal the ${colorsList.length - 1}');

  ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  AppTheme copyWith({bool? isDarkMode , int? selectedColor}) => AppTheme(
    selectedColor:  selectedColor ?? this.selectedColor,
    isDarkMode:  isDarkMode ?? this.isDarkMode
  );
}
