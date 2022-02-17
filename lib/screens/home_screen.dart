import 'package:flutter/material.dart';
import 'package:my_journal/components/entry_list_view.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import '../components/master_detail_view.dart';
import 'new_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.toggleTheme}) : super(key: key);

  final void Function() toggleTheme;
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: EntryListView(),
      horizontalBody: const MasterDetailView(),
      toggleTheme: toggleTheme,
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
