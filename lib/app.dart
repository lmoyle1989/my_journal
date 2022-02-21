import 'package:flutter/material.dart';
import 'package:my_journal/screens/new_entry_screen.dart';
import 'package:my_journal/screens/home_screen.dart';
import 'models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  App({
    Key? key,
    required this.title,
    required this.preferences,
  }) : super(key: key);

  final SharedPreferences preferences;
  final String title;
  final routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    NewEntryScreen.routeName: (context) => const NewEntryScreen(),
  };

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings =
        Settings(darkMode: widget.preferences.getBool('darkMode') ?? false);
  }

  void toggleTheme() {
    setState(() {
      settings.toggleDarkMode();
      widget.preferences.setBool('darkMode', settings.darkMode);
    });
  }

  ThemeData getDarkModeThemeData(Settings settings) {
    if (settings.darkMode) {
      return ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: getDarkModeThemeData(settings),
      routes: widget.routes,
    );
  }
}
