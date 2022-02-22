import 'package:flutter/material.dart';
import 'package:my_journal/components/journal_scaffold.dart';
import 'package:my_journal/components/new_entry_form.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({Key? key}) : super(key: key);

  static const String routeName = 'new_entry_screen';

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "New Entry",
      actionButton: null,
      body: SingleChildScrollView(
        child: NewEntryForm(),
      ),
    );
  }
}
