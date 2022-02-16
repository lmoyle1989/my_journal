import 'package:flutter/material.dart';
import 'package:my_journal/screens/list_view_screen.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'master_detail_view.dart';
import 'new_entry_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "List of Journal Entries",
      actionButton: newEntryButton(context),
      body: ListViewScreen(),
      horizontalBody: const MasterDetailScreen(),
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
