import 'package:flutter/material.dart';

class HqTheme {
  static ThemeData lightTheme({Color? primaryColor}) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
      useMaterial3: true,
      primaryColor: primaryColor ?? Color.fromARGB(255, 64, 81, 191),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
      useMaterial3: true,
    );
  }
}

Map<String, Color> HqThemeColorMap = {
  'gray': Colors.grey,
  'blue': Color.fromARGB(255, 64, 81, 191),
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

class AppInfoProvider with ChangeNotifier {
  String _themeColor = 'blue';

  String get themeColor => _themeColor;

  setTheme(String themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }
}
