import 'package:flutter/material.dart';
import 'package:my_journal/app.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  void Function() testToggle = () {};

  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();
    testToggle = () {
      appState!.toggleTheme();
    };
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ElevatedButton(
          onPressed: testToggle,
          child: const Text("Test"),
        ),
      ),
      color: Colors.white,
    );
  }
}
