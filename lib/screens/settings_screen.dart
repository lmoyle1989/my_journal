import 'package:flutter/material.dart';
import 'package:my_journal/app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ElevatedButton(
          onPressed: () {
            appState!.toggleTheme();
          },
          child: const Text("Test"),
        ),
      ),
      color: Colors.white,
    );
  }
}
