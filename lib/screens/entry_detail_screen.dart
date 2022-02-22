import 'package:flutter/material.dart';
import 'package:my_journal/components/entry_detail_view.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'package:my_journal/models/journal_entry.dart';

class EntryDetailScreen extends StatelessWidget {
  const EntryDetailScreen({Key? key, this.journalEntry}) : super(key: key);

  static const String routeName = 'entry_detail_screen';
  final JournalEntry? journalEntry;

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "View Entry",
      body: EntryDetailView(
        journalEntry: journalEntry,
      ),
    );
  }
}
