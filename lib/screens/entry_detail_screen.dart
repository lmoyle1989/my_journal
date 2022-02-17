import 'package:flutter/material.dart';
import 'package:my_journal/components/entry_detail_view.dart';
import 'package:my_journal/components/journal_scaffold.dart';

class EntryDetailScreen extends StatelessWidget {
  const EntryDetailScreen({Key? key}) : super(key: key);

  static const String routeName = 'entry_detail_screen';

  @override
  Widget build(BuildContext context) {
    return const JournalScaffold(
      title: "View Entry",
      body: EntryDetailView(),
    );
  }
}
