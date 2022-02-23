import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';
import 'package:my_journal/models/journal.dart';

class EntryListView extends StatelessWidget {
  const EntryListView({
    Key? key,
    this.journalEntries,
    required this.horizontal,
  }) : super(key: key);

  final JournalEntries? journalEntries;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    if (journalEntries!.entries.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: journalEntries?.entries.length,
        itemBuilder: (context, index) {
          return ListEntry(
            entryData: journalEntries!.entries[index],
            horizontal: horizontal,
          );
        },
      );
    }
  }
}
