import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry_tile.dart';
import 'package:my_journal/models/journal.dart';

class EntryListView extends StatelessWidget {
  const EntryListView({
    Key? key,
    this.journalEntries,
    required this.horizontal,
  }) : super(key: key);

  final Journal? journalEntries;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    if (journalEntries!.entries.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.note_alt_outlined,
              size: 200,
            ),
            Text("MY JOURNAL"),
          ],
        ),
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
