import 'package:flutter/material.dart';
import 'package:my_journal/models/settings.dart';

class SettingsSwitchTile extends StatefulWidget {
  final Settings settings;
  final void Function() onChangedFunction;

  const SettingsSwitchTile(
      {Key? key, required this.settings, required this.onChangedFunction})
      : super(key: key);

  @override
  _SettingsSwitchTileState createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Dark Mode"),
      value: widget.settings.darkMode,
      onChanged: (bool value) {
        setState(() {
          widget.onChangedFunction();
        });
      },
    );
  }
}
