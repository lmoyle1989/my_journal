import 'package:flutter/material.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'journal_list_screen.dart';
import 'entry_detail_screen.dart';

class MasterDetailScreen extends StatelessWidget {
  const MasterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(child: JournalListScreen()),
        Expanded(child: EntryDetailScreen()),
      ],
    ));
  }
}
