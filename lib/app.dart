import 'package:flutter/material.dart';
import 'package:my_journal/screens/new_entry_screen.dart';
import 'package:my_journal/screens/journal_list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;
  static final routes = {
    JournalListScreen.routeName: (context) => JournalListScreen(),
    NewEntryScreen.routeName: (context) => NewEntryScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      routes: routes,
    );
  }
}
