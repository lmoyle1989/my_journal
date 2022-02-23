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

  final Journal? journalEntries;
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
            decoration: BoxDecoration(
                border: Border.all(
              width: 5,
              color: Colors.blue,
            )),
            child: EntryDetailView(
              journalEntry: detailEntry,
            ),
          ),
        ),
      ],
    );
  }
}
