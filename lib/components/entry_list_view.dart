import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';
import 'package:my_journal/models/entry_data.dart';
import 'package:sqflite/sqflite.dart';

class EntryListView extends StatefulWidget {
  EntryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<EntryListView> createState() => _EntryListViewState();
}

class _EntryListViewState extends State<EntryListView> {
  late List<EntryData> journalItems = [];

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
      return EntryData(
          id: record['id'],
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          date: DateTime.parse(record['date']));
    }).toList();

    setState(() {
      journalItems = entryDataObjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journalItems.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: journalItems.length,
        itemBuilder: (context, index) {
          return ListEntry(
            entryData: journalItems[index],
          );
        },
      );
    }
  }
}
