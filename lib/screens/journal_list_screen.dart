import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'new_entry_screen.dart';

class JournalListScreen extends StatelessWidget {
  JournalListScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  final items = List<Map<String, String>>.generate(100, (i) {
    return {'title': "Entry $i", 'subtitle': "Subtitle Text $i"};
  });

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListEntry(
              title: items[index]['title'],
              subtitle: items[index]['subtitle'],
            );
          }),
    );
  }

  void pushNewEntryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntryScreen.routeName);
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
