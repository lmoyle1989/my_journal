import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:intl/intl.dart';

class EntryDetailView extends StatelessWidget {
  EntryDetailView({
    Key? key,
    this.journalEntry,
  }) : super(key: key);

  final JournalEntry? journalEntry;

  @override
  Widget build(BuildContext context) {
    if (journalEntry != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${journalEntry!.title}',
              style: const TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                ' ${journalEntry!.body}',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'RATING: ${journalEntry!.rating}',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DATE: ${(DateFormat('yyyy-MM-dd').format(journalEntry!.date as DateTime))}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(child: Icon(Icons.account_circle));
    }
  }
}
