import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:my_journal/screens/entry_detail_screen.dart';

class ListEntry extends StatelessWidget {
  const ListEntry({
    Key? key,
    required this.entryData,
  }) : super(key: key);

  final JournalEntry entryData;

  void pushDetailView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EntryDetailScreen(
          journalEntry: entryData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_alarm),
      title: Text(entryData.title ?? ""),
      subtitle: Text(entryData.date.toString()),
      onTap: () {
        pushDetailView(context);
      },
    );
  }
}
