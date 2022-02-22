import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';

class EntryDetailView extends StatelessWidget {
  const EntryDetailView({Key? key, this.journalEntry}) : super(key: key);

  final JournalEntry? journalEntry;

  @override
  Widget build(BuildContext context) {
    if (journalEntry != null) {
      return Column(children: [
        Text('${journalEntry!.title}'),
        Text('${journalEntry!.body}'),
        Text('${journalEntry!.rating}'),
        Text('${journalEntry!.date}'),
      ]);
    } else {
      return const Text("HELLO THERE");
    }
  }
}
