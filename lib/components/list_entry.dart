import 'package:flutter/material.dart';

class ListEntry extends StatelessWidget {
  const ListEntry({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_alarm),
      title: Text(title!),
      subtitle: Text(subtitle!),
    );
  }
}
