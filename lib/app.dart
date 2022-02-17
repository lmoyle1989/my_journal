import 'package:flutter/material.dart';
import 'package:my_journal/screens/new_entry_screen.dart';
import 'package:my_journal/screens/home_screen.dart';
import 'models/theme_switcher.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  late ThemeSwitcher themeSwitcher;
  late final routes = {
    HomeScreen.routeName: (context) => HomeScreen(),
    NewEntryScreen.routeName: (context) => NewEntryScreen(),
  };

  void toggleTheme() {
    setState(() {
      themeSwitcher.toggleTheme();
    });
  }

  @override
  void initState() {
    super.initState();
    themeSwitcher = ThemeSwitcher(curTheme: theme.light);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: getTheme(themeSwitcher),
      routes: routes,
    );
  }
}

ThemeData getTheme(ThemeSwitcher themeSwitcher) {
  if (themeSwitcher.curTheme == theme.dark) {
    return ThemeData.dark();
  } else {
    return ThemeData.light();
  }
}
