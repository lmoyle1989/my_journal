import 'package:flutter/material.dart';
import 'package:my_journal/components/entry_detail_view.dart';
import 'package:my_journal/components/journal_scaffold.dart';

class EntryDetailScreen extends StatelessWidget {
  const EntryDetailScreen({Key? key, required this.toggleTheme})
      : super(key: key);
  final void Function() toggleTheme;
  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "View Entry",
      body: EntryDetailView(),
      toggleTheme: toggleTheme,
    );
  }
}
