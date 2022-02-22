import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_journal/models/journal_entries.dart';

class EntryListView extends StatefulWidget {
  EntryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<EntryListView> createState() => EntryListViewState();
}

class EntryListViewState extends State<EntryListView> {
  late JournalEntries journalEntries = JournalEntries(entries: []);

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    String schema =
        await DefaultAssetBundle.of(context).loadString('assets/schema_1.txt');

    final Database database = await openDatabase(
      'journal.sqlite3.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(schema);
      },
    );

    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries');

    final entryDataObjects = journalRecords.map((record) {
      return JournalEntry(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          date: DateTime.parse(record['date']));
    }).toList();

    setState(() {
      journalEntries = JournalEntries(entries: entryDataObjects);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journalEntries.entries.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: journalEntries.entries.length,
        itemBuilder: (context, index) {
          return ListEntry(
            entryData: journalEntries.entries[index],
          );
        },
      );
    }
  }
}
