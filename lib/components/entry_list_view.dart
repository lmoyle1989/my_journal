import 'package:flutter/material.dart';
import 'package:my_journal/components/list_entry.dart';
import 'package:my_journal/models/entry_data.dart';

class EntryListView extends StatefulWidget {
  EntryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<EntryListView> createState() => _EntryListViewState();
}

class _EntryListViewState extends State<EntryListView> {
  late List<EntryData> items;

  @override
  void initState() {
    super.initState();
    items = List<EntryData>.generate(100, (i) {
      return EntryData(title: i.toString(), date: DateTime.now());
    });
  }

  void loadJournal() async {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListEntry(
          entryData: items[index],
        );
      },
    );
  }
}
