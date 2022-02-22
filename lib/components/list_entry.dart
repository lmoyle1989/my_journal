import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';

class ListEntry extends StatelessWidget {
  const ListEntry({
    Key? key,
    required this.entryData,
  }) : super(key: key);

  final JournalEntry entryData;
  //final String? title;
  //final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_alarm),
      title: Text(entryData.title ?? ""),
      subtitle: Text(entryData.date.toString()),
    );
  }
}
