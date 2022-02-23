import 'package:flutter/material.dart';
import 'package:my_journal/models/journal.dart';
import 'package:my_journal/screens/entry_detail_screen.dart';
import 'package:my_journal/screens/home_screen.dart';
import 'package:intl/intl.dart';

class ListEntry extends StatelessWidget {
  const ListEntry({
    Key? key,
    required this.entryData,
    required this.horizontal,
  }) : super(key: key);

  final JournalEntry entryData;
  final bool horizontal;

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

  Function() selectedOnTapFunction(BuildContext context) {
    if (horizontal) {
      return () {
        changeDetailView(context);
      };
    } else {
      return () {
        pushDetailViewScreen(context);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.insert_drive_file_outlined),
      title: Text(entryData.title ?? ""),
      subtitle:
          Text((DateFormat('yyyy-MM-dd').format(entryData.date as DateTime))),
      onTap: selectedOnTapFunction(context),
    );
  }
}
