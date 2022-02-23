import 'package:flutter/material.dart';
import 'package:my_journal/app.dart';
import 'package:my_journal/components/settings_switch_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();
    return Padding(
      padding: const EdgeInsets.only(
        left: 60,
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Settings"),
          ),
        ),
        body: Column(
          children: [
            SettingsSwitchTile(
              settings: appState!.settings,
              onChangedFunction: appState.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
