import 'package:flutter/material.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'package:my_journal/components/entry_list_view.dart';
import 'package:my_journal/models/journal.dart';
import 'package:sqflite/sqflite.dart';
import '../components/master_detail_view.dart';
import 'new_entry_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Journal journalEntries = Journal(entries: []);
  // ignore: avoid_init_to_null
  late JournalEntry? selectedEntry = null;

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
      journalEntries = Journal(entries: entryDataObjects);
    });
  }

  void updateSelectedEntry(JournalEntry selected) {
    setState(() {
      selectedEntry = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: EntryListView(
        journalEntries: journalEntries,
        horizontal: false,
      ),
      horizontalBody: MasterDetailView(
        journalEntries: journalEntries,
        detailEntry: selectedEntry,
      ),
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
      child: const Icon(Icons.note_add_outlined),
    );
  }
}
