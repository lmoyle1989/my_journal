import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'entry_detail_view.dart';
import 'package:my_journal/models/journal_entries.dart';
import 'entry_list_view.dart';

class MasterDetailView extends StatelessWidget {
  const MasterDetailView({
    Key? key,
    this.journalEntries,
    this.detailEntry,
  }) : super(key: key);

  final JournalEntries? journalEntries;
  final JournalEntry? detailEntry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: EntryListView(
          journalEntries: journalEntries,
        )),
        Expanded(
          child: EntryDetailView(
            journalEntry: detailEntry,
          ),
        ),
      ],
    );
  }
}
