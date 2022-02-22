import 'package:flutter/material.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'package:my_journal/components/entry_list_view_stateless.dart';
import 'package:my_journal/models/journal_entries.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';
import '../components/master_detail_view.dart';
import 'new_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: EntryListViewStateless(
        journalEntries: journalEntries,
      ),
      horizontalBody: const MasterDetailView(),
    );
  }

  void pushNewEntryScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(NewEntryScreen.routeName)
        .then((value) => loadJournal());
  }

  FloatingActionButton newEntryButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        pushNewEntryScreen(context);
      },
      child: const Text("+"),
    );
  }
}
