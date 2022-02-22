import 'package:flutter/material.dart';
import 'package:my_journal/models/journal_entry.dart';
import 'package:my_journal/screens/entry_detail_screen.dart';
import 'package:my_journal/screens/home_screen.dart';

class ListEntry extends StatelessWidget {
  const ListEntry({
    Key? key,
    required this.entryData,
  }) : super(key: key);

  final JournalEntry entryData;

  void pushDetailViewScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EntryDetailScreen(
          journalEntry: entryData,
        ),
      ),
    );
  }

  void changeDetailView(BuildContext context) {
    HomeScreenState? homeScreenState =
        context.findAncestorStateOfType<HomeScreenState>();
    homeScreenState?.updateSelectedEntry(entryData);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_alarm),
      title: Text(entryData.title ?? ""),
      subtitle: Text(entryData.date.toString()),
      onTap: () {
        pushDetailViewScreen(context);
      },
    );
  }
}
