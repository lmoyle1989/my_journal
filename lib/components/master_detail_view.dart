import 'package:flutter/material.dart';
import 'package:my_journal/models/journal.dart';
import 'entry_detail_view.dart';
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
          horizontal: true,
        )),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: EntryDetailView(
              journalEntry: detailEntry,
            ),
          ),
        ),
      ],
    );
  }
}
