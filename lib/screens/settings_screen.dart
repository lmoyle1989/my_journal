import 'package:flutter/material.dart';
import 'package:my_journal/app.dart';
import 'package:my_journal/components/settings_switch_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();
    return SettingsSwitchTile(
      settings: appState!.settings,
      onChangedFunction: appState.toggleTheme,
    );
  }
}
