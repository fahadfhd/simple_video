import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sample_vid/providers/base_provider.dart';
import 'package:sample_vid/utils/colors.dart';

class ThemeProvider extends BaseProvider {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() : super(name: "ThemeProvider");

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    // iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: colorGrey,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    // iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
